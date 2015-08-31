# A controller for users
class UsersController < ApplicationController
  def show
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to current_user, notice: 'Profile successfully updated.'
    else
      render :edit, error: 'Unable to update profile. Please try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:bio,:avatar)
  end
end
