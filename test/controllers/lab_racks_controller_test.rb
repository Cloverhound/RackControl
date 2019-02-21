require 'test_helper'

class LabRacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_rack = lab_racks(:one)
  end

  test "should get index" do
    get lab_racks_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_rack_url
    assert_response :success
  end

  test "should create lab_rack" do
    assert_difference('LabRack.count') do
      post lab_racks_url, params: { lab_rack: { description: @lab_rack.description, name: @lab_rack.name } }
    end

    assert_redirected_to lab_rack_url(LabRack.last)
  end

  test "should show lab_rack" do
    get lab_rack_url(@lab_rack)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_rack_url(@lab_rack)
    assert_response :success
  end

  test "should update lab_rack" do
    patch lab_rack_url(@lab_rack), params: { lab_rack: { description: @lab_rack.description, name: @lab_rack.name } }
    assert_redirected_to lab_rack_url(@lab_rack)
  end

  test "should destroy lab_rack" do
    assert_difference('LabRack.count', -1) do
      delete lab_rack_url(@lab_rack)
    end

    assert_redirected_to lab_racks_url
  end
end
