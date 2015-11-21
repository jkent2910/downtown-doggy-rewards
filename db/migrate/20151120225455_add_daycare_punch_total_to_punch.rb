class AddDaycarePunchTotalToPunch < ActiveRecord::Migration
  def change
    add_column :punches, :daycare_punch_total, :integer
  end
end
