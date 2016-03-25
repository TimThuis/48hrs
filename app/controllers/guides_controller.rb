class GuidesController < ApplicationController
  before_action :find_guide, only: [:detail, :show]
  respond_to :js, only: [:detail]

  def index #view
    @guides = User.where(guide: true)
  end

  def show #view
    @tour = @guide.tours.first
  end

  def detail

  end

  private

  def find_guide
    @guide = User.where(guide: true).find(params[:id])
  end

end
