class ChangeColumnPhoneContact < ActiveRecord::Migration[5.1]
  def change
  	change_column :phone_contacts, :Number, :string
  end
end
