class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit create update]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def show
  end

  def create 
    @user.client_id = @user.current_user
    @user.professional_id = User.find(params[:user_id])
    appointment.save
  end

  def update
    # fetch restaurant to update from DB
    @user = User.find(params[:user_id])
    # update record
    @appointment.update(appointment_params)
    # redirect to restaurant
    redirect_to appointment_path(appointment)
  end
    
  private

  def appointment_params
    params.require(:appointment).permit(:professional_id, :client_id, :appointment_date)
  end

end
