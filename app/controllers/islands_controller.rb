class IslandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_island, only: %i[ show edit update destroy ]

  # GET /islands or /islands.json
  def index
    @q = Island.ransack(params[:q])
    @islands = @q.result(distinct: true).includes(:clients)


    #@islands = Island.all
  end

  # GET /islands/1 or /islands/1.json
  def show
  end

  # GET /islands/new
  def new
    @island = Island.new
  end

  # GET /islands/1/edit
  def edit
  end

  # POST /islands or /islands.json
  def create
    @island = Island.new(island_params)

    respond_to do |format|
      if @island.save
        format.html { redirect_to islands_url, notice: "Island was successfully created." }
        format.json { render :show, status: :created, location: @island }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @island.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /islands/1 or /islands/1.json
  def update
    respond_to do |format|
      #Island.public_activity_off
      if @island.update(island_params)
        Island.public_activity_on
        format.html { redirect_to islands_url, notice: "Island was successfully updated." }
        format.json { render :show, status: :ok, location: @island }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @island.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /islands/1 or /islands/1.json
  def destroy
    @island.destroy

    respond_to do |format|
      format.html { redirect_to islands_url, notice: "Island was successfully destroyed." }
      format.json { head :no_content }
    end
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
