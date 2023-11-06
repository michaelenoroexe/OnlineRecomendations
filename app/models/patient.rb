class Patient < ApplicationRecord
  has_many :consultation_requests, dependent: :destroy
  validates :full_name, absence: true
  validates :date_of_birth, presence: true  
  validates :email, absence: true, uniqueness: true
end
