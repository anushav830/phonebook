class AddUniqueConstraint < ActiveRecord::Migration[5.1]
  def change
  	add_index :entries, [:Name], unique: true
  end
end
