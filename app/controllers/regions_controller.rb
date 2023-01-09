class RegionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_island
  before_action :set_region, only: %i[ show edit update destroy ]

  # GET /regions or /regions.json
  def index
    @q = @island.regions.ransack(params[:q])
    @f = @q.result(distinct: true).includes(:island, :clients)
    @pagy, @regions = pagy(@q.result.includes(:island, :clients))
    @current_island_regions = @island.regions
    #@regions = Region.all
  end

  # GET /regions/1 or /regions/1.json
  def show
  end

  # GET /regions/new
  def new
    @region = @island.regions.build
    #@region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions or /regions.json
  def create
    @region = @island.regions.build(region_params)
    #@region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to region_url(@region), notice: "Region was successfully created." }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1 or /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to region_url(@region), notice: "Region was successfully updated." }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1 or /regions/1.json
  def destroy
    @region.destroy

    respond_to do |format|
      format.html { redirect_to regions_url, notice: "Region was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_island
      @island = Island.find(params[:island_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = @island.regions.find(params[:id])
      #@region = Region.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def region_params
      params.require(:region).permit(:region_name, :island_id)
    end
    
end
