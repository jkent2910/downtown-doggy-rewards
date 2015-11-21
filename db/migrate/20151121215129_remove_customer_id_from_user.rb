class RemoveCustomerIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :customer_id, :integer
  end
end
