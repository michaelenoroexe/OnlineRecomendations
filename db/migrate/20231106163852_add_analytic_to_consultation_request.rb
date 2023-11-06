class AddAnalyticToConsultationRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :consultation_requests, :analytic, :text
  end
end
