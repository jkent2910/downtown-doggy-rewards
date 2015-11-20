class Customer < ActiveRecord::Base
  has_many :punches
  validates :first_name, :last_name, presence: true 
end
