require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do 
    it "returns http success" do 
      get :index 
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #search" do 
    before do 
      post :search, query: "Julie" 
    end

    it "assigns customer search results to @customers" do 
      expect(assigns[:customers]).to be_a Customer::ActiveRecord_Relation 
    end

    it "renders the index template" do 
      expect(response).to render_template(:index)
    end
  end
end
