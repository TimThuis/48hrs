class Account::ProfilesController < ApplicationController
  def show
  end

  def edit
    @account = current_user
  end

  def update
  end
end
