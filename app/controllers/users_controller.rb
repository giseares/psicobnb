class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users =  policy_scope(User.where(professional: true)).order(created_at: :desc)
  end
end
