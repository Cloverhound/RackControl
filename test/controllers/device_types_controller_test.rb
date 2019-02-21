require 'test_helper'

class DeviceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_type = device_types(:one)
  end

  test "should get index" do
    get device_types_url
    assert_response :success
  end

  test "should get new" do
    get new_device_type_url
    assert_response :success
  end

  test "should create device_type" do
    assert_difference('DeviceType.count') do
      post device_types_url, params: { device_type: { model: @device_type.model, name: @device_type.name, vendor: @device_type.vendor } }
    end

    assert_redirected_to device_type_url(DeviceType.last)
  end

  test "should show device_type" do
    get device_type_url(@device_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_type_url(@device_type)
    assert_response :success
  end

  test "should update device_type" do
    patch device_type_url(@device_type), params: { device_type: { model: @device_type.model, name: @device_type.name, vendor: @device_type.vendor } }
    assert_redirected_to device_type_url(@device_type)
  end

  test "should destroy device_type" do
    assert_difference('DeviceType.count', -1) do
      delete device_type_url(@device_type)
    end

    assert_redirected_to device_types_url
  end
end
