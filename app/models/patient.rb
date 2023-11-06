class Patient < ApplicationRecord
  validates :full_name, absence: true
  validates :date_of_birth, presence: true  
  validates :email, absence: true, uniqueness: true
end
