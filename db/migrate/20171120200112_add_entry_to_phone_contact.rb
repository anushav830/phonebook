class AddEntryToPhoneContact < ActiveRecord::Migration[5.1]
  def change
    add_column :phone_contacts, :entry_id, :integer
    add_index :phone_contacts, :entry_id
  end
end
