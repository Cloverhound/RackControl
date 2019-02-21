require "application_system_test_case"

class LabRacksTest < ApplicationSystemTestCase
  setup do
    @lab_rack = lab_racks(:one)
  end

  test "visiting the index" do
    visit lab_racks_url
    assert_selector "h1", text: "Lab Racks"
  end

  test "creating a Lab rack" do
    visit lab_racks_url
    click_on "New Lab Rack"

    fill_in "Description", with: @lab_rack.description
    fill_in "Name", with: @lab_rack.name
    click_on "Create Lab rack"

    assert_text "Lab rack was successfully created"
    click_on "Back"
  end

  test "updating a Lab rack" do
    visit lab_racks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @lab_rack.description
    fill_in "Name", with: @lab_rack.name
    click_on "Update Lab rack"

    assert_text "Lab rack was successfully updated"
    click_on "Back"
  end

  test "destroying a Lab rack" do
    visit lab_racks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lab rack was successfully destroyed"
  end
end
