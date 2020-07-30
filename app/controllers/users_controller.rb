class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def show
    @user = User.find(params[:id])
    if @user.professional
    @profile = Profile.find_by user_id: params[:id]
    @appointment = Appointment.new
    #@users_coo = User.geocoded # returns flats with coordinates
    @marker =
      [{
        lat: @user.latitude,
        lng: @user.longitude
      }]
    else
      authorize @user
      redirect_to root_path
    end
    authorize @user
  end

  def index
    @users = []
    if !params.nil?
      # Ejecuto el query con los filtros
      @profiles = query_builder(params)
      if @profiles.present?
        @users = policy_scope(User.where(id: @profiles.pluck(:user_id))).order(created_at: :desc)
      else
        @users = policy_scope(User.where(professional: true)).order(created_at: :desc)
      end
    else
      @users = policy_scope(User.where(professional: true)).order(created_at: :desc)
    end
    @users_coo = User.geocoded # returns flats with coordinates
    @markers = @users_coo.map do |users_coo|
      {
        lat: users_coo.latitude,
        lng: users_coo.longitude
      }
    end
    @users
  end

  def query_builder(param)
    school = param[:school].presence
    speciality = param[:speciality].presence
    if school && speciality
      @profiles = Profile.where("school LIKE ? AND speciality LIKE ?", school, speciality)
    elsif speciality
      @profiles = Profile.where("speciality LIKE ?", speciality)
    elsif school
      @profiles = Profile.where("school LIKE ?", school)
    else
      @profiles = nil
    end
    @profiles
  end
end
