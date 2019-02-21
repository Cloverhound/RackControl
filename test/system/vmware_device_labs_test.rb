require "application_system_test_case"

class VmwareDeviceLabsTest < ApplicationSystemTestCase
  setup do
    @vmware_device_lab = vmware_device_labs(:one)
  end

  test "visiting the index" do
    visit vmware_device_labs_url
    assert_selector "h1", text: "Vmware Device Labs"
  end

  test "creating a Vmware device lab" do
    visit vmware_device_labs_url
    click_on "New Vmware Device Lab"

    fill_in "Lab", with: @vmware_device_lab.lab_id
    fill_in "Snapshot name", with: @vmware_device_lab.snapshot_name
    fill_in "Vmware device", with: @vmware_device_lab.vmware_device_id
    click_on "Create Vmware device lab"

    assert_text "Vmware device lab was successfully created"
    click_on "Back"
  end

  test "updating a Vmware device lab" do
    visit vmware_device_labs_url
    click_on "Edit", match: :first

    fill_in "Lab", with: @vmware_device_lab.lab_id
    fill_in "Snapshot name", with: @vmware_device_lab.snapshot_name
    fill_in "Vmware device", with: @vmware_device_lab.vmware_device_id
    click_on "Update Vmware device lab"

    assert_text "Vmware device lab was successfully updated"
    click_on "Back"
  end

  test "destroying a Vmware device lab" do
    visit vmware_device_labs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vmware device lab was successfully destroyed"
  end
end
