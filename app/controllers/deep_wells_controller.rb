class DeepWellsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: %i[ discard index show edit update new create destroy ]
  before_action :set_deep_well, only: %i[ discard show edit update destroy ]
  before_action :set_deep_well_archive, only: %i[ restore permanent_destroy]
  before_action :set_counter, only: %i[ create update destroy show restore permanent_destroy ]

  # GET /deep_wells or /deep_wells.json
  def index 
    @q = @client.deep_wells.kept.ransack(params[:q])
    @f = @q.result(distinct: true).includes(:client)
    @pagy, @deep_wells = pagy(@q.result(distinct: true).includes(:client))
    @current_client_deep_wells = @client.deep_wells.kept
    @backclient = Region.find_by(id: @client.region_id)
    # @deep_wells = DeepWell.all
  end 

  def archive
    @deep_wells = DeepWell.discarded
  end

  def show_archive
    @deep_well = DeepWell.find(params[:id])
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
    AuditLog.new(event: "view", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today, counter: @counter).save
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
        AuditLog.new(event: "create", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today, counter: @counter).save
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
        AuditLog.new(event: "update", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today, counter: @counter).save
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

  def restore
    AuditLog.new(event: "restore", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today, counter: @counter).save
    @deep_well.undiscard
    redirect_to archive_path, notice: "Deep well was restored."
  end

  def destroy
    AuditLog.new(event: "archive", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today, counter: @counter).save
    @deep_well.discard
    redirect_to [@client, :deep_wells], notice: "Deep well was successfully archived."
  end

  # DELETE /deep_wells/1 or /deep_wells/1.json
  def permanent_destroy
  AuditLog.new(event: "delete", modifier: current_user.email, table_name: "Deep Well", object_name: @deep_well.deep_well_name, date_created: Date.today, counter: @counter).save
  if AuditLog.count > 10000
    AuditLog.first.delete
  end
    @deep_well.destroy
    respond_to do |format|
      format.html { redirect_to archive_path, notice: "Deep well was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_deep_well
      @deep_well = @client.deep_wells.find(params[:id])
    end

    def set_deep_well_archive
      @deep_well = DeepWell.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deep_well_params
      params.require(:deep_well).permit(:log, :waterPermit, :deep_well_name, :client_id, :dateGranted, :clientName, :wellLocation, :xCoordinate, :yCoordinate, :waterPermitNo, :contractor, :depthTotal, :dateofUTVI, :reason, :remarks, :limit, :driller_name, :depthTotalUnits, :waterLimitUnits, :dateConstructed, asbuilt: [], design: [], utviFile: [])
    end

    def set_counter
      @counter = AuditLog.last
      @counter = @counter.counter + 1
    end

end