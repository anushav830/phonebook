class AddrefKey < ActiveRecord::Migration[5.1]
  def change
  	add_index :phone_contacts, [:Label, :Number, :entry_id], unique: true
  end
end
