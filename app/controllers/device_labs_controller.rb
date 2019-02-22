class DeviceLabsController < ApplicationController
  before_action :set_device_lab, only: [:show, :edit, :update, :destroy]

  # GET /device_labs
  # GET /device_labs.json
  def index
    @device_labs = DeviceLab.all
  end

  # GET /device_labs/1
  # GET /device_labs/1.json
  def show

  end

  def restore
    @device_lab = DeviceLab.find(params[:device_lab_id])
    res = Cisco.revert(Device.find(@device_lab.device_id),@device_lab.config_name)
    redirect_to lab_rack_lab_path(:lab_rack_id => Lab.find(@device_lab.lab_id).lab_rack_id,:id => @device_lab.lab_id), notice: res
  end

  # GET /device_labs/new
  def new
    @device_lab = DeviceLab.new
  end

  # GET /device_labs/1/edit
  def edit
  end

  # POST /device_labs
  # POST /device_labs.json
  def create
    @device_lab = DeviceLab.new(device_lab_params)

    respond_to do |format|
      if @device_lab.save
        format.html { redirect_to lab_rack_lab_path(:lab_rack_id => Lab.find(@device_lab.lab_id).lab_rack_id, :id =>@device_lab.lab_id), notice: 'Device lab was successfully created.' }
        format.json { render :show, status: :created, location: @device_lab }
      else
        format.html { render :new }
        format.json { render json: @device_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_labs/1
  # PATCH/PUT /device_labs/1.json
  def update
    respond_to do |format|
      if @device_lab.update(device_lab_params)
        format.html { redirect_to @device_lab, notice: 'Device lab was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_lab }
      else
        format.html { render :edit }
        format.json { render json: @device_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_labs/1
  # DELETE /device_labs/1.json
  def destroy
    @device_lab.destroy
    respond_to do |format|
      format.html { redirect_to device_labs_url, notice: 'Device lab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_lab
      @device_lab = DeviceLab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_lab_params
      params.require(:device_lab).permit(:device_id, :lab_id, :config_id, :config_name)
    end
end
