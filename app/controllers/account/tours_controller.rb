class Account::ToursController < ApplicationController
  before_action :find_tour, only: [:edit, :update, :destroy]


  def index #view
    @tours = current_user.tours
    @guide = current_user
  end

  def new #view
    @tour = Tour.new
    @categories = Category.all
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user

    if @tour.save!
      flash[:notice] = "Succesfully saved your tour"
      redirect_to(account_tours_path)
    else
      flash[:alert] = "Please make sure you fill in the field"
      render :new
    end
  end

  def edit #view
    @categories = Category.all
  end

  def update
    @tour.update(tour_params)
    @tour.user = current_user

    if @tour.save
      flash[:notice] = "Succesfully updated your tour"
      redirect_to(account_tours_path)
    else
      flash[:alert] = "Please make sure you fill in the field"
      render :edit
    end
  end

  def destroy
    # TODO: YOU HAVE TO FETCH THAT THERE IS NO BOOKINGS ON THE TOUR YOU WANT TO DELETE11!!!111
    @tour.destroy!
    redirect_to(account_tours_path)
  end

  private

  def find_tour
    @tour = current_user.tours.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:description, :category_id)
  end

end
