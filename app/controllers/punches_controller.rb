class PunchesController < ApplicationController
  before_action :set_punch, only: [:show, :edit, :update, :destroy]
 
  before_action :set_customer

  before_action :authenticate_admin! 
  
  def new
    @punch = Punch.new
  end
 
  def create
    @punch = Punch.new(punch_params)
    @punch.customer_id = @customer.id

    if @punch.save
      redirect_to @customer, notice: "Punch(es) successfully added or redeemed"
    else
      render 'new'
    end 
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @punch.update(punch_params)
  end
  
  def destroy
    @punch.destroy
    redirect_to root_path
  end
  
  private
    
    def set_punch
      @punch = Punch.find(params[:id])
    end
    
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
    
    def punch_params
      params.require(:punch).permit(:punch_category, :punch_number, :note)
    end
end
