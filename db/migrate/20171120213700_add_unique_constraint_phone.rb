class AddUniqueConstraintPhone < ActiveRecord::Migration[5.1]
  def change
  	add_index :phone_contacts, [:Label, :entry_id], unique: true
  end
end
