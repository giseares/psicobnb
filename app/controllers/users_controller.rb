class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users =  policy_scope(User.where(professional: true)).order(created_at: :desc)
  end

  def profile
    @profile = Profile.find_by user_id: params[:user_id]
    @user = User.find(@profile.user_id)
    authorize @user
  end

  private

  def users_params
    params.require(:user).permit(:id, :photo)
  end
end
