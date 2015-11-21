class WelcomeController < ApplicationController
  before_action :redirect_on_signin 

  def index
  end

  def redirect_on_signin 
    if admin_signed_in? 
      redirect_to customers_path
    end
  end

end
