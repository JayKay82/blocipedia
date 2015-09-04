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

  def downgrade
    if Downgrade.make_standard(current_user)
      redirect_to current_user, notice: 'Your account was successfully downgraded.'
    else
      redirect_to current_user, error: 'Unable to downgrade your account. Please try again.'
    end
    # downgraded = Downgrade.user_to_standard(current_user)
    # redirect_to current_user, notice: downgraded.message
  end

  private

  def user
    @user ||= User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:bio,:avatar)
  end

  helper_method :user
end
