class Author < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    # validates_uniqueness_of :name, :case_sensitive => false
    validates :phone_number, length: { is: 10 }
    
    
end
