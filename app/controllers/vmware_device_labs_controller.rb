class VmwareDeviceLabsController < ApplicationController
  before_action :set_vmware_device_lab, only: [:show, :edit, :update, :destroy]

  # GET /vmware_device_labs
  # GET /vmware_device_labs.json
  def index
    @vmware_device_labs = VmwareDeviceLab.all
  end

  # GET /vmware_device_labs/1
  # GET /vmware_device_labs/1.json
  def show
  end

  # GET /vmware_device_labs/new
  def new
    @vmware_device_lab = VmwareDeviceLab.new
  end

  # GET /vmware_device_labs/1/edit
  def edit
  end

  def restore
    @vmware_device_lab = VmwareDeviceLab.find(params[:vmware_device_lab_id])
    res = Vmware.revert(VmwareDevice.find(@vmware_device_lab.vmware_device_id),@vmware_device_lab.snapshot_name)
    redirect_to lab_rack_lab_path(:lab_rack_id => Lab.find(@vmware_device_lab.lab_id).lab_rack_id,:id => @vmware_device_lab.lab_id), notice: res
  end

  # POST /vmware_device_labs
  # POST /vmware_device_labs.json
  def create
    @vmware_device_lab = VmwareDeviceLab.new(vmware_device_lab_params)

    respond_to do |format|
      if @vmware_device_lab.save
        format.html { redirect_to lab_rack_lab_path(:lab_rack_id => Lab.find(@vmware_device_lab.lab_id).lab_rack_id, :id =>@vmware_device_lab.lab_id), notice: 'Vmware device lab was successfully created.' }
        format.json { render :show, status: :created, location: @vmware_device_lab }
      else
        format.html { render :new }
        format.json { render json: @vmware_device_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vmware_device_labs/1
  # PATCH/PUT /vmware_device_labs/1.json
  def update
    respond_to do |format|
      if @vmware_device_lab.update(vmware_device_lab_params)
        format.html { redirect_to @vmware_device_lab, notice: 'Vmware device lab was successfully updated.' }
        format.json { render :show, status: :ok, location: @vmware_device_lab }
      else
        format.html { render :edit }
        format.json { render json: @vmware_device_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vmware_device_labs/1
  # DELETE /vmware_device_labs/1.json
  def destroy
    @vmware_device_lab.destroy
    respond_to do |format|
      format.html { redirect_to vmware_device_labs_url, notice: 'Vmware device lab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vmware_device_lab
      @vmware_device_lab = VmwareDeviceLab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vmware_device_lab_params
      params.require(:vmware_device_lab).permit(:vmware_device_id, :lab_id, :snapshot_name)
    end
end
