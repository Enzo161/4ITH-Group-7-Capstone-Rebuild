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
