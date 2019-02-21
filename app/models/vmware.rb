class Vmware < ApplicationRecord
  def self.find_snapshot(list, snapshot_name)
          list.each do |i|
              if i.name == snapshot_name
                  return i.snapshot
              elsif !i.childSnapshotList.empty?
                  snap = find_snapshot(i.childSnapshotList, snapshot_name)
                  return snap if snap
              end
          end

          nil
      end
      def self.power_on(device)

        vim = RbVmomi::VIM.connect(host: device.vsphere_host, user: device.username, password: device.password, insecure: true)
        root_folder = vim.serviceInstance.content.rootFolder
        dc = root_folder.childEntity.grep(RbVmomi::VIM::Datacenter).find { |x| x.name == 'Cloverhound' } || fail('datacenter not found')
        vm = dc.vmFolder.childEntity.grep(RbVmomi::VIM::VirtualMachine).find { |x| x.name == 'vWLC' } || fail('VM not found')
        task = vm.PowerOnVM_Task
        filter = vim.propertyCollector.CreateFilter(
          spec: {
            propSet: [{ type: 'Task', all: false, pathSet: ['info.state']}],
            objectSet: [{ obj: task }]
          },
          partialUpdates: false
        )
        ver = ''
        loop do
          result = vim.propertyCollector.WaitForUpdates(version: ver)
          ver = result.version
          break if ['success', 'error'].member?(task.info.state)
        end
        filter.DestroyPropertyFilter
        @result = task.info.state
        raise(task.info.error) if task.info.state == 'error'
      end

       def self.revert(device,snapshot_name)
         vim = RbVmomi::VIM.connect(host: device.vsphere_host, user: device.username, password: device.password, insecure: true)
         root_folder = vim.serviceInstance.content.rootFolder
         dc = root_folder.childEntity.grep(RbVmomi::VIM::Datacenter).find { |x| x.name == device.datacenter_name } || fail('datacenter not found')
         vm = dc.vmFolder.childEntity.grep(RbVmomi::VIM::VirtualMachine).find { |x| x.name == device.vm_name } || fail('VM not found')
         list = vm.snapshot.rootSnapshotList

             snapshot = Vmware.find_snapshot(list, snapshot_name)
             return nil if !snapshot

             revert_snapshot_hash = {
                 :_this => snapshot
             }

             task = snapshot.RevertToSnapshot_Task(revert_snapshot_hash)
         filter = vim.propertyCollector.CreateFilter(
           spec: {
             propSet: [{ type: 'Task', all: false, pathSet: ['info.state']}],
             objectSet: [{ obj: task }]
           },
           partialUpdates: false
         )
         ver = ''
         loop do
           result = vim.propertyCollector.WaitForUpdates(version: ver)
           ver = result.version
           break if ['success', 'error'].member?(task.info.state)
         end
         filter.DestroyPropertyFilter
         @result = task.info.state
         raise(task.info.error) if task.info.state == 'error'

       end
end
