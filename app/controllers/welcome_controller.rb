class WelcomeController < ApplicationController
  before_action :redirect_on_signin 
  before_action :authenticate_user!, only: [:user_home]

  def index
  end

  def user_home
    @user = current_user 
    @customer = Customer.find_by(email: @user.email).to_param
  end


  def redirect_on_signin 
    if admin_signed_in? 
      redirect_to customers_path
    end
  end

end
