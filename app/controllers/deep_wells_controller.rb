class DeepWellsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  before_action :set_deep_well, only: %i[ show edit update destroy ]

  # GET /deep_wells or /deep_wells.json
  def index 
    @q = @client.deep_wells.ransack(params[:q])
    @f = @q.result(distinct: true).includes(:client)
    @pagy, @deep_wells = pagy(@q.result(distinct: true).includes(:client))
    # @deep_wells = DeepWell.all
  end 

  # To delete log attachment
  def purge_log_attachment
    @log = ActiveStorage::Attachment.find(params[:id])
    @log.purge 
    redirect_back fallback_location: @root_path, notice: "Successfully deleted Lithologic Log."
  end
  # To delete water permit attachment
  def purge_waterPermit_attachment
    @waterPermit = ActiveStorage::Attachment.find(params[:id])
    @waterPermit.purge 
    redirect_back fallback_location: @root_path, notice: "Successfully deleted Water Permit."
  end

  # To delete asbuilt attachments
  def purge_asbuilt_attachment
    @asbuilt = ActiveStorage::Attachment.find(params[:id])
    @asbuilt.purge
    redirect_back fallback_location: @root_path, notice: "Successfully deleted As Built Design."
  end

  # To delete UTVI attachments
  def purge_utviFile_attachment
    @utviFile = ActiveStorage::Attachment.find(params[:id])
    @utviFile.purge
    redirect_back fallback_location: @root_path, notice: "Successfully deleted UTVI File."
  end

  # To delete design attachment
  def purge_design_attachment
    @design = ActiveStorage::Attachment.find(params[:id])
    @design.purge 
    redirect_back fallback_location: @root_path, notice: "Successfully deleted Proposed Deep Well Design."
  end

  # GET /deep_wells/1 or /deep_wells/1.json
  def show
    AuditLog.new(event: "view", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today).save
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
        AuditLog.new(event: "create", modifier: current_user.email, table_name: "Deep Well", object_name: @client.client_name, date_created: Date.today).save
        if AuditLog.count > 10000
          AuditLog.first.delete
        end
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
        AuditLog.new(event: "update", modifier: current_user.email, table_name: "Deep Well", object_name: @client.client_name, date_created: Date.today).save
        if AuditLog.count > 10000
          AuditLog.first.delete
        end
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
  AuditLog.new(event: "delete", modifier: current_user.email, table_name: "Deep Well", object_name: @client.client_name, date_created: Date.today).save
  if AuditLog.count > 10000
    AuditLog.first.delete
  end
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
      params.require(:deep_well).permit(:log, :waterPermit, :deep_well_name, :client_id, :dateGranted, :clientName, :wellLocation, :wellCoodinates, 
        :waterPermitNo, :contractor, :depthTotal, :dateofUTVI, :reason, :remarks, :limit, :driller_name, :dateConstructed, asbuilt: [], design: [], utviFile: [])
    end
end