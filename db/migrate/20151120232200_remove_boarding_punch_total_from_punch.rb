class RemoveBoardingPunchTotalFromPunch < ActiveRecord::Migration
  def change
    remove_column :punches, :boarding_punch_total, :integer
  end
end
