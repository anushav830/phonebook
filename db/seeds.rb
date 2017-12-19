# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#

PhoneContact.destroy_all

Entry.destroy_all

contacts = []

# generate fake data

10.times do |i|
	new_contact = {
		id: i,
		Name: Faker::Name.unique.name		
	}
	contacts.push(new_contact)
end

# Save the fake data to database
Entry.create(contacts)





