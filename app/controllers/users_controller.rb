class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users = User.all
  end
end
