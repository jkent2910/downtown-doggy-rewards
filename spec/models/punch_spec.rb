require 'rails_helper'

RSpec.describe Punch, type: :model do
  context "validations" do
    [:punch_category, :punch_number].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end

    # TODO: Understand why this isn't working
    # it "allows only valid punch categories" do
    #   expect(subject).to validate_inclusion_of(:punch_category).in_array(Punch::VALID_PUNCH_CATEGORIES)
    # end
  end

  context "relationships" do
    it "belongs to customer" do
      expect(subject).to belong_to :customer
    end
  end
end
