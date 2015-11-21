class SearchController < ApplicationController
  def index
  end

  def search
    query = params[:query]
    @customers = Customer.search(query) 
    render :index 
  end
end
