require "application_system_test_case"

class DevicesTest < ApplicationSystemTestCase
  setup do
    @device = devices(:one)
  end

  test "visiting the index" do
    visit devices_url
    assert_selector "h1", text: "Devices"
  end

  test "creating a Device" do
    visit devices_url
    click_on "New Device"

    fill_in "Device type", with: @device.device_type_id
    fill_in "Enable password", with: @device.enable_password
    fill_in "Ip address", with: @device.ip_address
    fill_in "Name", with: @device.name
    fill_in "Password", with: @device.password
    fill_in "Transport type", with: @device.transport_type
    fill_in "Username", with: @device.username
    click_on "Create Device"

    assert_text "Device was successfully created"
    click_on "Back"
  end

  test "updating a Device" do
    visit devices_url
    click_on "Edit", match: :first

    fill_in "Device type", with: @device.device_type_id
    fill_in "Enable password", with: @device.enable_password
    fill_in "Ip address", with: @device.ip_address
    fill_in "Name", with: @device.name
    fill_in "Password", with: @device.password
    fill_in "Transport type", with: @device.transport_type
    fill_in "Username", with: @device.username
    click_on "Update Device"

    assert_text "Device was successfully updated"
    click_on "Back"
  end

  test "destroying a Device" do
    visit devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device was successfully destroyed"
  end
end
