class Patient < ApplicationRecord
  has_many :consultation_requests, dependent: :destroy
  validates :full_name, presence: true
  validates :date_of_birth, presence: true  
  validates :email, presence: true, uniqueness: true
end
