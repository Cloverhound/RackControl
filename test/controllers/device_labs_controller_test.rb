require 'test_helper'

class DeviceLabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_lab = device_labs(:one)
  end

  test "should get index" do
    get device_labs_url
    assert_response :success
  end

  test "should get new" do
    get new_device_lab_url
    assert_response :success
  end

  test "should create device_lab" do
    assert_difference('DeviceLab.count') do
      post device_labs_url, params: { device_lab: { config_id: @device_lab.config_id, device_id: @device_lab.device_id, lab_id: @device_lab.lab_id } }
    end

    assert_redirected_to device_lab_url(DeviceLab.last)
  end

  test "should show device_lab" do
    get device_lab_url(@device_lab)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_lab_url(@device_lab)
    assert_response :success
  end

  test "should update device_lab" do
    patch device_lab_url(@device_lab), params: { device_lab: { config_id: @device_lab.config_id, device_id: @device_lab.device_id, lab_id: @device_lab.lab_id } }
    assert_redirected_to device_lab_url(@device_lab)
  end

  test "should destroy device_lab" do
    assert_difference('DeviceLab.count', -1) do
      delete device_lab_url(@device_lab)
    end

    assert_redirected_to device_labs_url
  end
end
