class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.integer :customer_id
      t.string :punch_category
      t.integer :punch_number

      t.timestamps null: false
    end
  end
end
