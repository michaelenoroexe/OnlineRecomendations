class ConsultationRequest < ApplicationRecord
  has_many :recommendations
  belongs_to :patient
end
