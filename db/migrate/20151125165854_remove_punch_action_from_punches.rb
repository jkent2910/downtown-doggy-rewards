class RemovePunchActionFromPunches < ActiveRecord::Migration
  def change
    remove_column :punches, :punch_action, :string
  end
end
