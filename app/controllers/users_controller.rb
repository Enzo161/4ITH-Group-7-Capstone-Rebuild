class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action do
    redirect_to root_path unless current_user && current_user.role == "admin" || current_user.role == "super admin"
  end

  def resend_invitation
    @user = User.find(params[:id])
    if @user.created_by_invite? && @user.invitation_accepted? == false
      @user.invite!
      redirect_to users_path, notice: "Invitation has been resent"
    else
      redirect_to users_path, notice: "User has already accepted the invitation"
    end
  end

  # GET /users or /users.json
  def index
    #search
    if current_user.role == "super admin"
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    elsif current_user.role == "admin"
      @q = User.where.not(role: "super admin").ransack(params[:q]) #&& User.where(role: "admin").ransack(params[:q])
      @users = @q.result(distinct: true)
    end
  end

  def promote
    @user = User.find(params[:id])
    @user.update(role: "admin")
    redirect_to users_path
  end

  def demote
    @user = User.find_by(:id=>params[:id])
    @user.update(role: "user")
    redirect_to users_path
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {})
  end

end