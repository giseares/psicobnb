class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users = User.all
  end

  def profile
    @profile = Profile.find_by user_id: params[:user_id]
    @user = User.find(@profile.user_id)
    authorize @user
  end
end
