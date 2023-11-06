class AddPatientRefToConsultationRequest < ActiveRecord::Migration[7.1]
  def change
    add_reference :consultation_requests, :patient, null: false, foreign_key: true
  end
end
