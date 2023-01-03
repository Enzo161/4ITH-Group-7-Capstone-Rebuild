class ArchivesController < ApplicationController
  before_action :set_archive, only: %i[ show edit update destroy ]

  # GET /archives or /archives.json
  def index
    #@archives = Archive.all
    @deep_wells = DeepWell.discarded
  end

  # GET /archives/1 or /archives/1.json
  def show
  end

  # DELETE /archives/1 or /archives/1.json
  def destroy
    @deep_well.destroy

    respond_to do |format|
      format.html { redirect_to archives_url, notice: "Archive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

end
