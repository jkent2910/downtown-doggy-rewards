class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :check_for_existing_customer, only: [:new, :create] 
  before_action :ensure_customer_ownership, only: [:edit, :update, :destroy, :show]
  before_action :check_for_admin, only: [:index]

  def index 
    @customers = Customer.order(:last_name)
  end

  def show
    @punches = Punch.where(customer_id: @customer.id).order("created_at DESC")
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if user_signed_in? 
      @user = current_user
      @customer.user_id = @user.id 
    else 
    end 

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: 'Customer successfully deleted'
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :user_id)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def check_for_existing_customer 
    return if current_admin or Customer.where(email: current_user.email).none?
    redirect_to home_path, notice: "You already have a customer account"
  end


  def ensure_customer_ownership 
    return if current_admin or current_user.email == Customer.find(params[:id]).email
    redirect_to home_path, notice: "You are not allowed to view other customer accounts"
  end

  def check_for_admin 
    if current_user
      redirect_to home_path, notice: "You are not allowed to view this page"
    end
  end
end
