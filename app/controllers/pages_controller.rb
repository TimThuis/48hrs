class PagesController < ApplicationController

  def home
    @booking = current_user
  end

end
