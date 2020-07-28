class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit create update ]

  def index
    @reviews = Review.all
  end
  
  def show
  end
    
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    if @review.save
      redirect_to user_appointments_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:appointment_id])
    if @review.update(review_params)
      redirect_to user_appointments_path
    else
      render :new
    end
  end
 
  private

  def set_review
    @review = Review.find(params[:id])
  end
 
  def review_params
    params.require(:review).permit(:rating_sharp, :rating_qualityprice, :rating_facilities)
  end

end
