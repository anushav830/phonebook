class RemoveIndex < ActiveRecord::Migration[5.1]
  def change
  	add_index :phone_contacts, [:Number, :entry_id], unique: true

	remove_index(:phone_contacts, :name => 'index_phone_contacts_on_Label_and_Number')
  end
end
