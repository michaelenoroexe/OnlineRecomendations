class Recommendation < ApplicationRecord
  belongs_to :consultation_request, dependent: :destroy
end
