class VmwareDevicesController < ApplicationController
  before_action :set_vmware_device, only: [:show, :edit, :update, :destroy]

  # GET /vmware_devices
  # GET /vmware_devices.json
  def index
    @vmware_devices = VmwareDevice.where(:lab_rack_id => params[:lab_rack_id])
  end

  # GET /vmware_devices/1
  # GET /vmware_devices/1.json
  def show
  end

  # GET /vmware_devices/new
  def new
    @vmware_device = VmwareDevice.new
  end

  # GET /vmware_devices/1/edit
  def edit
  end

  # POST /vmware_devices
  # POST /vmware_devices.json
  def create
    @vmware_device = VmwareDevice.new(vmware_device_params)

    respond_to do |format|
      if @vmware_device.save
        format.html { redirect_to lab_rack_vmware_device_path(:id => @vmware_device.id), notice: 'Vmware device was successfully created.' }
        format.json { render :show, status: :created, location: @vmware_device }
      else
        format.html { render :new }
        format.json { render json: @vmware_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vmware_devices/1
  # PATCH/PUT /vmware_devices/1.json
  def update
    respond_to do |format|
      if @vmware_device.update(vmware_device_params)
        format.html { redirect_to lab_rack_vmware_device_path(:id => @vmware_device.id), notice: 'Vmware device was successfully updated.' }
        format.json { render :show, status: :ok, location: @vmware_device }
      else
        format.html { render :edit }
        format.json { render json: @vmware_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vmware_devices/1
  # DELETE /vmware_devices/1.json
  def destroy
    @vmware_device.destroy
    respond_to do |format|
      format.html { redirect_to lab_rack_vmware_devices_url, notice: 'Vmware device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vmware_device
      @vmware_device = VmwareDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vmware_device_params
      params.require(:vmware_device).permit(:vm_name, :datacenter_name, :vsphere_host, :username, :password, :description, :lab_rack_id)
    end
end
