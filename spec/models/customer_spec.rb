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
end
