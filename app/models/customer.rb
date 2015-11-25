class Customer < ActiveRecord::Base
  has_many :punches
  belongs_to :user
  validates :first_name, :last_name, presence: true

  searchable_by :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def total_punches(punch_category = nil)
    if punch_category
      punches.where(punch_category: punch_category).sum(:punch_number)
    else
      punches.sum(:punch_number)
    end
  end
end
