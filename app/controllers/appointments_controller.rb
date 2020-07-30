class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update show]

  def index
    @appointments = policy_scope(Appointment).all
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @user = User.find(params[:user_id])
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client_id = current_user.id
    @appointment.professional_id = params[:user_id]
    @appointment.session_price = Profile.find_by(user_id: params[:user_id]).price
    if @appointment.save!
      redirect_to appointments_path(params[:professional_id])
    else
      render :new
    end
    authorize @appointment
  end

  def update
    # fetch appointment to update from DB
    @appointment.client_id = current_user.id
    @user = User.find(params[:user_id])
    # update record
    @appointment.update(appointment_params)
    # redirect to appointment
    redirect_to appointment_path(appointment)
    # aaprobar las modifcaciones
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :start_hour, :professional_id)
  end
end
