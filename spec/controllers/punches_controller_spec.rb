require 'rails_helper'

RSpec.describe PunchesController, type: :controller do
  include Devise::TestHelpers

  before do
    @carrie = FactoryGirl.create(:carrie)
    sign_in @carrie
  end

  let(:valid_parameters) {
    {
      punch_category: "Boarding",
      punch_number: 1,
      punch_action: 'Add Punches'
    }
  }

  describe "POST #create" do
    before do
      @customer = FactoryGirl.create(:customer)
    end

    it "creates a punch" do
      expect {
        post :create, { customer_id: @customer.to_param, punch: valid_parameters }
      }.to change { Punch.count }.by 1
    end
  end
end
