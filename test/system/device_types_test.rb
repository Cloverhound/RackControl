require "application_system_test_case"

class DeviceTypesTest < ApplicationSystemTestCase
  setup do
    @device_type = device_types(:one)
  end

  test "visiting the index" do
    visit device_types_url
    assert_selector "h1", text: "Device Types"
  end

  test "creating a Device type" do
    visit device_types_url
    click_on "New Device Type"

    fill_in "Model", with: @device_type.model
    fill_in "Name", with: @device_type.name
    fill_in "Vendor", with: @device_type.vendor
    click_on "Create Device type"

    assert_text "Device type was successfully created"
    click_on "Back"
  end

  test "updating a Device type" do
    visit device_types_url
    click_on "Edit", match: :first

    fill_in "Model", with: @device_type.model
    fill_in "Name", with: @device_type.name
    fill_in "Vendor", with: @device_type.vendor
    click_on "Update Device type"

    assert_text "Device type was successfully updated"
    click_on "Back"
  end

  test "destroying a Device type" do
    visit device_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device type was successfully destroyed"
  end
end
