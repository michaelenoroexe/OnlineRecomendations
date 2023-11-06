class CreateConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :consultation_requests do |t|
      t.text :request_text
      t.date :creation_date

      t.timestamps
    end
  end
end
