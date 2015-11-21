class AddBoardingPunchTotalToPunch < ActiveRecord::Migration
  def change
    add_column :punches, :boarding_punch_total, :integer
  end
end
