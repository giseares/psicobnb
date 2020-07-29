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
    authorize @profile.user
  end

  def update_profile
    @profile = Profile.find_by user_id: params[:user_id]
    if @profile.update(profile_params)
      @user = User.find(params[:user_id])
      authorize @user
      redirect_to user_path(@user)
    else
      render :new
    end
    # @profile.school = params[:profile][:school]
    # @profile.license_number = params[:profile][:license_number]
    # @profile.speciality = params[:profile][:speciality]
    # @profile.price = params[:profile][:price]
  end

  private

  def profile_params
    params.require(:profile).permit(:school, :license_number, :speciality, :price)
  end
end
