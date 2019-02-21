require "application_system_test_case"

class VmwareDevicesTest < ApplicationSystemTestCase
  setup do
    @vmware_device = vmware_devices(:one)
  end

  test "visiting the index" do
    visit vmware_devices_url
    assert_selector "h1", text: "Vmware Devices"
  end

  test "creating a Vmware device" do
    visit vmware_devices_url
    click_on "New Vmware Device"

    fill_in "Datacenter name", with: @vmware_device.datacenter_name
    fill_in "Description", with: @vmware_device.description
    fill_in "Password", with: @vmware_device.password
    fill_in "Username", with: @vmware_device.username
    fill_in "Vm name", with: @vmware_device.vm_name
    fill_in "Vsphere host", with: @vmware_device.vsphere_host
    click_on "Create Vmware device"

    assert_text "Vmware device was successfully created"
    click_on "Back"
  end

  test "updating a Vmware device" do
    visit vmware_devices_url
    click_on "Edit", match: :first

    fill_in "Datacenter name", with: @vmware_device.datacenter_name
    fill_in "Description", with: @vmware_device.description
    fill_in "Password", with: @vmware_device.password
    fill_in "Username", with: @vmware_device.username
    fill_in "Vm name", with: @vmware_device.vm_name
    fill_in "Vsphere host", with: @vmware_device.vsphere_host
    click_on "Update Vmware device"

    assert_text "Vmware device was successfully updated"
    click_on "Back"
  end

  test "destroying a Vmware device" do
    visit vmware_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vmware device was successfully destroyed"
  end
end
