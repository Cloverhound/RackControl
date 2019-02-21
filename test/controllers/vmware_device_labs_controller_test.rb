require 'test_helper'

class VmwareDeviceLabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vmware_device_lab = vmware_device_labs(:one)
  end

  test "should get index" do
    get vmware_device_labs_url
    assert_response :success
  end

  test "should get new" do
    get new_vmware_device_lab_url
    assert_response :success
  end

  test "should create vmware_device_lab" do
    assert_difference('VmwareDeviceLab.count') do
      post vmware_device_labs_url, params: { vmware_device_lab: { lab_id: @vmware_device_lab.lab_id, snapshot_name: @vmware_device_lab.snapshot_name, vmware_device_id: @vmware_device_lab.vmware_device_id } }
    end

    assert_redirected_to vmware_device_lab_url(VmwareDeviceLab.last)
  end

  test "should show vmware_device_lab" do
    get vmware_device_lab_url(@vmware_device_lab)
    assert_response :success
  end

  test "should get edit" do
    get edit_vmware_device_lab_url(@vmware_device_lab)
    assert_response :success
  end

  test "should update vmware_device_lab" do
    patch vmware_device_lab_url(@vmware_device_lab), params: { vmware_device_lab: { lab_id: @vmware_device_lab.lab_id, snapshot_name: @vmware_device_lab.snapshot_name, vmware_device_id: @vmware_device_lab.vmware_device_id } }
    assert_redirected_to vmware_device_lab_url(@vmware_device_lab)
  end

  test "should destroy vmware_device_lab" do
    assert_difference('VmwareDeviceLab.count', -1) do
      delete vmware_device_lab_url(@vmware_device_lab)
    end

    assert_redirected_to vmware_device_labs_url
  end
end
