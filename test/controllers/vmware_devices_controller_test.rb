require 'test_helper'

class VmwareDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vmware_device = vmware_devices(:one)
  end

  test "should get index" do
    get vmware_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_vmware_device_url
    assert_response :success
  end

  test "should create vmware_device" do
    assert_difference('VmwareDevice.count') do
      post vmware_devices_url, params: { vmware_device: { datacenter_name: @vmware_device.datacenter_name, description: @vmware_device.description, password: @vmware_device.password, username: @vmware_device.username, vm_name: @vmware_device.vm_name, vsphere_host: @vmware_device.vsphere_host } }
    end

    assert_redirected_to vmware_device_url(VmwareDevice.last)
  end

  test "should show vmware_device" do
    get vmware_device_url(@vmware_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_vmware_device_url(@vmware_device)
    assert_response :success
  end

  test "should update vmware_device" do
    patch vmware_device_url(@vmware_device), params: { vmware_device: { datacenter_name: @vmware_device.datacenter_name, description: @vmware_device.description, password: @vmware_device.password, username: @vmware_device.username, vm_name: @vmware_device.vm_name, vsphere_host: @vmware_device.vsphere_host } }
    assert_redirected_to vmware_device_url(@vmware_device)
  end

  test "should destroy vmware_device" do
    assert_difference('VmwareDevice.count', -1) do
      delete vmware_device_url(@vmware_device)
    end

    assert_redirected_to vmware_devices_url
  end
end
