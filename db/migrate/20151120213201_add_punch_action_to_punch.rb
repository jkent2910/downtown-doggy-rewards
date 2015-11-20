class AddPunchActionToPunch < ActiveRecord::Migration
  def change
    add_column :punches, :punch_action, :string
  end
end
