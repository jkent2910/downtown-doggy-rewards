class Punch < ActiveRecord::Base
  belongs_to :customer
  validates :punch_category, :punch_number, :punch_action, presence: true 

  VALID_PUNCH_CATEGORIES = ['Boarding', 'Daycare']

  VALID_PUNCH_ACTIONS = ['Add Punches', 'Remove Punches']

end


