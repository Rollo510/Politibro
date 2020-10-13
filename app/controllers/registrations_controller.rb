class RegistrationsController < Devise::RegistrationsController
  before_action :create_facebook_username

  def create_facebook_username
      email = current_user.email
      current_user.username = email[/[^@]+/]
  end
    
  
  
  
  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end



end