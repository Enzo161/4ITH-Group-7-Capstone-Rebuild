class IslandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_island, only: %i[ show edit update destroy ]

  # GET /islands or /islands.json
  def index
    @q = Island.ransack(params[:q])
    @f = @q.result(distinct: true).includes(:regions)
    @pagy, @islands = pagy(@q.result(distinct: true).includes(:regions))
    #@pagy = pagy(Island.order(created_at: :desc))
    #@islands = Island.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_island
      @island = Island.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def island_params
      params.require(:island).permit(:island_name)
    end
end
