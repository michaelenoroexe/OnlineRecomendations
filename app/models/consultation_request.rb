class ConsultationRequest < ApplicationRecord
  has_many :recommendations
  belongs_to :patient
  validates :request_text, presence: true
  before_create :set_current_date

  private
  def set_current_date
    self.creation_date = Date.today
  end
end
