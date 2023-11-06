class RemovePhoneFromPatient < ActiveRecord::Migration[7.1]
  def change
    remove_column :patients, :phone, :integer
  end
end
