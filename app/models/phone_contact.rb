class PhoneContact < ApplicationRecord

	attr_accessor :Name, :entry_id
	belongs_to :entry, autosave: true

	validates :Label, presence: true, :uniqueness => { :scope => :entry_id, case_sensitive: false }, :allow_blank => false, inclusion: %w(Work Home Cell), :if => :Number?
	validates :Number, presence: true, :uniqueness => { :scope => :entry_id, case_sensitive: false }, :allow_blank => false, length: { minimum: 10 }, :if => :Label?

	validates_each :Label,:Number do |record, attr, value|
    	record.errors.each do |key, value|
        if value.blank?
          record.errors[:base] << "Value is blank"
        end
      end
    end

	before_save :unmask_number, message: 'phone number is invalid'

	def unmask_number
		if self.Number.blank?
			return false
		end
        paren_reg = /\A\((\d{3})\)\s+(\d{3})-(\d{4})\z/
		if paren_reg.match(self.Number)!=nil
     		self.Number = self.Number[1,3] + self.Number[6,3] + self.Number[10,4]
     	end
  	end

end



