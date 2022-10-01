class UsermanagesController < ApplicationController
  before_action :set_usermanage, only: %i[ show edit update destroy ]

  # GET /usermanages or /usermanages.json
  def index
    @usermanages = Usermanage.all
  end

  # GET /usermanages/1 or /usermanages/1.json
  def show
  end

  # GET /usermanages/new
  def new
    @usermanage = Usermanage.new
  end

  # GET /usermanages/1/edit
  def edit
  end

  # POST /usermanages or /usermanages.json
  def create
    @usermanage = Usermanage.new(usermanage_params)

    respond_to do |format|
      if @usermanage.save
        format.html { redirect_to usermanage_url(@usermanage), notice: "Usermanage was successfully created." }
        format.json { render :show, status: :created, location: @usermanage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usermanage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usermanages/1 or /usermanages/1.json
  def update
    respond_to do |format|
      if @usermanage.update(usermanage_params)
        format.html { redirect_to usermanage_url(@usermanage), notice: "Usermanage was successfully updated." }
        format.json { render :show, status: :ok, location: @usermanage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usermanage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usermanages/1 or /usermanages/1.json
  def destroy
    @usermanage.destroy

    respond_to do |format|
      format.html { redirect_to usermanages_url, notice: "Usermanage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usermanage
      @usermanage = Usermanage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usermanage_params
      params.require(:usermanage).permit(:name, :email)
    end
end
