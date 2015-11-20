class CustomersController < ApplicationController

  before_action :authenticate_admin!, only: [:edit, :update, :new, :create]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index 
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
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
      params.require(:customer).permit(:first_name, :last_name)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end


end
