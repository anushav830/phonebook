class CreatePhoneContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_contacts do |t|
      t.string :Label
      t.integer :Number

      t.timestamps
    end
  end
end
