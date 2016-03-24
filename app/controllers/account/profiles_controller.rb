class Account::ProfilesController < ApplicationController
  def show
  end

  def edit
    @account = current_user
  end

  def update
    @account = current_user
    @account.update(edit_params)

    if @account.save!
      flash[:notice] = "Succesfully updated your profile."
      redirect_to account_profile_path
    else
      flash[:notice] = "Please make sure you fill in the fields"
      render :new
    end
  end

  private

  def edit_params
    params.require(:user).permit(:email, :phone, :first_name, :last_name, :street, :zipcode, :city, :birthday, :bio, :hour_rate)
  end
end
