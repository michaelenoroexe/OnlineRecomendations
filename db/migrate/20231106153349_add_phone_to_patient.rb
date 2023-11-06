class AddPhoneToPatient < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :phone, :bigint
  end
end
