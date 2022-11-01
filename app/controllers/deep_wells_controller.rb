class DeepWellsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  before_action :set_deep_well, only: %i[ show edit update destroy ]

  # GET /deep_wells or /deep_wells.json
  def index 
    @q = @client.deep_wells.ransack(params[:q])
    @deep_wells = @q.result.includes(:client)
    # @deep_wells = DeepWell.all
  end

  # To delete log attachment
  def purge_log_attachment
    @log = ActiveStorage::Attachment.find(params[:id])
    @log.purge 
    redirect_back fallback_location: @root_path, notice: "Successfully deleted Lithologic Log."
  end

  # To delete asbuilt attachments
  def purge_asbuilt_attachment
    @asbuilt = ActiveStorage::Attachment.find(params[:id])
    @asbuilt.purge
    redirect_back fallback_location: @root_path, notice: "Successfully deleted As Built Design."
  end

  # To delete design attachment
  def purge_design_attachment
    @design = ActiveStorage::Attachment.find(params[:id])
    @design.purge 
    redirect_back fallback_location: @root_path, notice: "Successfully deleted Proposed Deep Well Design."
  end

  # GET /deep_wells/1 or /deep_wells/1.json
  def show
  end

  # GET /deep_wells/new
  def new
    @deep_well = @client.deep_wells.build
    # @deep_well = DeepWell.new
  end

  # GET /deep_wells/1/edit
  def edit
  end

  # POST /deep_wells or /deep_wells.json
  def create
    @deep_well = @client.deep_wells.build(deep_well_params)
    # @deep_well = DeepWell.new(deep_well_params)

    respond_to do |format|
      if @deep_well.save
        format.html { redirect_to [@client, :deep_wells], notice: "Deep well was successfully created." }
        format.json { render :show, status: :created, location: @deep_well }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deep_well.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deep_wells/1 or /deep_wells/1.json
  def update
    respond_to do |format| 
      if @deep_well.update(deep_well_params)
        format.html { redirect_to client_deep_well_path([@client, @deep_well]), notice: "Deep well was successfully updated." }
        format.json { render :show, status: :ok, location: @deep_well }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deep_well.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deep_wells/1 or /deep_wells/1.json
  def destroy
    @deep_well.destroy
    respond_to do |format|
      format.html { redirect_to [@client, :deep_wells], notice: "Deep well was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_deep_well
      # @deep_well = DeepWell.find(params[:id])
      @deep_well = @client.deep_wells.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deep_well_params
      params.require(:deep_well).permit(:log, :deep_well_name, :client_id, :dateGranted, :clientName, :wellLocation, :wellCoodinates, 
        :waterPermitNo, :contractor, :depthTotal, :dateofUTVI, :reason, asbuilt: [], design: [])
    end
end