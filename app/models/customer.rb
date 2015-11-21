class Customer < ActiveRecord::Base
  has_many :punches
  belongs_to :user
  validates :first_name, :last_name, presence: true 

  searchable_by :first_name, :last_name 

  def full_name 
    "#{first_name} #{last_name}".strip 
  end
  
end
