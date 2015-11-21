class RemoveDaycarePunchTotalFromPunch < ActiveRecord::Migration
  def change
    remove_column :punches, :daycare_punch_total, :integer
  end
end
