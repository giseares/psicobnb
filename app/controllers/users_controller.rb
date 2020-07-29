class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users = []
    if !params.nil?
      if params[:school] != "" && params[:speciality] != ""
        query1 = "school LIKE '%#{params[:school]}%'"
        query2 = "speciality LIKE '%#{params[:speciality]}%'"
        @profiles = Profile.where(query1).where(query2)
      elsif params[:school] == "" && params[:speciality] != ""
        query = "speciality LIKE '%#{params[:speciality]}%'"
        @profiles = Profile.where(query)
      elsif params[:school] != "" && params[:speciality] == ""
        query = "school LIKE '%#{params[:school]}%'"
        @profiles = Profile.where(query)
      end
      @profiles.each do |profile|
        @users.push(policy_scope(User.where(id: profile.user_id)).order(created_at: :desc))
      end
    else
      @users = policy_scope(User.where(professional: true)).order(created_at: :desc)
    end

    @users
  end

  def profile
    @profile = Profile.find_by user_id: params[:user_id]
    @user = User.find(params[:user_id])
    authorize @user
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
