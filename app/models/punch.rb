class Punch < ActiveRecord::Base
  belongs_to :customer
  validates :punch_category, :punch_number, presence: true 

  VALID_PUNCH_CATEGORIES = ['Boarding', 'Daycare']
end


