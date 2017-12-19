class AddCandidateKey < ActiveRecord::Migration[5.1]
  def change
  	 add_index :phone_contacts, [:Label, :Number], unique: true
  end
end
