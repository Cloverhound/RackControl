class LabsController < ApplicationController
  before_action :set_lab, only: [:show, :edit, :update, :destroy]

  # GET /labs
  # GET /labs.json
  def index
    @labs = Lab.where(:lab_rack_id => params[:lab_rack_id])
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
    @device_labs = DeviceLab.where(:lab_id => params[:id])
    @vmware_device_labs = VmwareDeviceLab.where(:lab_id => params[:id])
  end

  def restore
    @lab = params[:lab_id]
    @devices = DeviceLab.where(:lab_id => @lab)
    @vm_devices = VmwareDeviceLab.where(:lab_id => @lab)
    notice = ""
    @devices.each do |d|
      res = Cisco.revert(Device.find(d.device_id),d.config_name)
      notice += res + ' : '
    end
    @vm_devices.each do |vd|
      res = Vmware.revert(VmwareDevice.find(vd.vmware_device_id),vd.snapshot_name)
      notice += res + ' : '
    end

    redirect_to lab_rack_path(:id => Lab.find(@lab).lab_rack_id), notice: notice
  end

  # GET /labs/new
  def new
    @lab = Lab.new
  end

  # GET /labs/1/edit
  def edit
  end

  # POST /labs
  # POST /labs.json
  def create
    @lab = Lab.new(lab_params)

    respond_to do |format|
      if @lab.save
        format.html { redirect_to lab_rack_lab_path(:id => @lab.id), notice: 'Lab was successfully created.' }
        format.json { render :show, status: :created, location: @lab }
      else
        format.html { render :new }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labs/1
  # PATCH/PUT /labs/1.json
  def update
    respond_to do |format|
      if @lab.update(lab_params)
        format.html { redirect_to lab_rack_lab_path(:id => @lab.id), notice: 'Lab was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab }
      else
        format.html { render :edit }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.json
  def destroy
    @lab.destroy
    respond_to do |format|
      format.html { redirect_to lab_rack_labs_url, notice: 'Lab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab
      @lab = Lab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_params
      params.require(:lab).permit(:name, :description, :lab_rack_id)
    end
end
