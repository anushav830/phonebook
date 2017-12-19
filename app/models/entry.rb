class Entry < ApplicationRecord  
	has_many :phone_contacts, inverse_of: :entry, :dependent => :destroy
	accepts_nested_attributes_for :phone_contacts, :reject_if => :all_blank, :allow_destroy => true
	validates :Name, presence: true, :uniqueness => { case_sensitive: false }
	validates_format_of :Name, :with => /\A[a-zA-Z]+([\s][a-zA-Z]+)\z/, message: "pattern is invalid, please enter(only leters) in the format FirstName Lastname", :if => :Name?
	validates_associated :phone_contacts

  validate :uniqueness_of_phone_contacts
  
  def uniqueness_of_phone_contacts
    errors.add(:Label, 'must be unique') if phone_contacts.map(&:Label).uniq.size != phone_contacts.size
    errors.add(:Number, 'must be unique') if phone_contacts.map(&:Number).uniq.size != phone_contacts.size
  end


  def self.search(search)
    where("Name LIKE ?", "%#{search}%") 
  end

  before_save :capitalize_name

  def capitalize_name
  		self.Name = self.Name.to_s.titleize if self.Name && !self.Name.blank?
  end

end
