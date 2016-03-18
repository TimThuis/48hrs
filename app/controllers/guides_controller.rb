class GuidesController < ApplicationController

  def index #view
    @guides = User.where(guide: true)
  end

  def show #view
    @guide = User.where(guide: true).find(params[:id])
  end

end
