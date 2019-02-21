require "application_system_test_case"

class DeviceLabsTest < ApplicationSystemTestCase
  setup do
    @device_lab = device_labs(:one)
  end

  test "visiting the index" do
    visit device_labs_url
    assert_selector "h1", text: "Device Labs"
  end

  test "creating a Device lab" do
    visit device_labs_url
    click_on "New Device Lab"

    fill_in "Config", with: @device_lab.config_id
    fill_in "Device", with: @device_lab.device_id
    fill_in "Lab", with: @device_lab.lab_id
    click_on "Create Device lab"

    assert_text "Device lab was successfully created"
    click_on "Back"
  end

  test "updating a Device lab" do
    visit device_labs_url
    click_on "Edit", match: :first

    fill_in "Config", with: @device_lab.config_id
    fill_in "Device", with: @device_lab.device_id
    fill_in "Lab", with: @device_lab.lab_id
    click_on "Update Device lab"

    assert_text "Device lab was successfully updated"
    click_on "Back"
  end

  test "destroying a Device lab" do
    visit device_labs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device lab was successfully destroyed"
  end
end
