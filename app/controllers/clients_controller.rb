class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @q = @region.clients.ransack(params[:q])
    @f = @q.result(distinct: true).includes(:region, :deep_wells)
    @pagy, @clients = pagy(@q.result.includes(:region, :deep_wells))
    @current_region_clients = @region.clients
    @backregion = Island.find_by(id: @region.island_id)
    # @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = @region.clients.build
    # @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = @region.clients.build(client_params)
    # @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        AuditLog.new(event: "create", modifier: current_user.email, table_name: "Client", object_name: @client.client_name, date_created: Date.today).save
        if AuditLog.count > 10000
          AuditLog.first.delete
        end
        format.html { redirect_to [@region, :clients], notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        AuditLog.new(event: "update", modifier: current_user.email, table_name: "Client", object_name: @client.client_name, date_created: Date.today).save
        if AuditLog.count > 10000
          AuditLog.first.delete
        end
        format.html { redirect_to [@region, :clients], notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    AuditLog.new(event: "delete", modifier: current_user.email, table_name: "Client", object_name: @client.client_name, date_created: Date.today).save
    if AuditLog.count > 10000
      AuditLog.first.delete
    end
    @client.destroy
    respond_to do |format|
      format.html { redirect_to [@region, :clients], notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_region
      @region = Region.find(params[:region_id])
    end

    def set_client
      @client = @region.clients.find(params[:id])
      # @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:client_name, :region_id)
    end
end
