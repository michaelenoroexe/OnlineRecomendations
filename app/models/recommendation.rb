class Recommendation < ApplicationRecord
  belongs_to :consultation_request, dependent: :destroy
  validates :recommendation_text, presence: true
end
