class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit create update ]

  def index
    if current_user.professional?
      @reviews = Review.all.select {|review| review.appointment.professional == current_user }
    else
      @reviews = Review.all.select {|review| review.appointment.client == current_user }
    end
  end
  
  def show
  end
    
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
    authorize @review
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new(review_params)
    @review.appointment = @appointment
    if @review.save
      redirect_to appointment_path
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
