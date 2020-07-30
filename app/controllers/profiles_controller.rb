class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by user_id: params[:user_id]
    @user = User.find(params[:user_id])
    authorize @user
  end

  def update
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
