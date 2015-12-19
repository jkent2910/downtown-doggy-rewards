class AddNoteToPunch < ActiveRecord::Migration
  def change
    add_column :punches, :note, :text
  end
end
