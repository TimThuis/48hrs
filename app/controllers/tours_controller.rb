class ToursController < ApplicationController
  def index #view
    category_id = params[:category_id]

    if category_id.blank?
      @selected_category = 'none'
      @tours = Tour.all
      @guides = User.all
    else
      @selected_category = Category.find(category_id)
      @tours = Tour.select{|t| t.category == @selected_category}
      guides = User.select{|u| u.guide == true && u.tours.map{|t| t.category.id}.include?(category_id.to_i)}
      @guides = guides.sort {|guide1, guide2| guide2[:rating] <=> guide1[:rating]}
      if @guides.blank?
        flash[:notice] = "We're sorry, we don't have any guides for this category."
        @guides = User.select{|u| u.guide}
      end
    end
    @categories = Category.all
  end

  def show #view
  end
end
