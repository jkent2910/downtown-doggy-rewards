require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "validations" do
    [:first_name, :last_name].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end
  end

  context "relationships" do
    it "has many punches" do
      expect(subject).to have_many :punches
    end
  end

  context "search" do
    before do
      @customer1 = FactoryGirl.create(:customer, first_name: "Julie", last_name: "Kent")
      @customer2 = FactoryGirl.create(:customer, first_name: "Gary", last_name: "Kent")
      @customer3 = FactoryGirl.create(:customer, first_name: "Troy", last_name: "Renken")
    end

    it "is searchable by first name" do
      expect(Customer.search("Julie")).to contain_exactly(@customer1)
    end

    it "is searchable by last name" do
      expect(Customer.search("Kent")).to contain_exactly(@customer1, @customer2)
    end

    it "can return no records" do
      expect(Customer.search("Roadie and Bo")).to be_empty
    end
  end

  context "punches" do
    before do
      @customer = FactoryGirl.create(:customer)
      @customer.punches << FactoryGirl.create(:punch, punch_number: 10, punch_category: 'DayCare')
      @customer.punches << FactoryGirl.create(:punch, punch_number: -5, punch_category: 'DayCare')
      @customer.punches << FactoryGirl.create(:punch, punch_number: 8, punch_category: 'Boarding')
      @customer.punches << FactoryGirl.create(:punch, punch_number: 6, punch_category: 'Boarding')
    end

    it "totals punches" do
      expect(@customer.total_punches).to eq 19
    end

    it "totals DayCare punches" do
      expect(@customer.total_punches("DayCare")).to eq 5
    end

    it "totals Boarding punches" do
      expect(@customer.total_punches("Boarding")).to eq 14
    end

    it "returns 0 for unknown punch categories" do
      expect(@customer.total_punches("Bogus")).to eq 0
    end
  end
end
