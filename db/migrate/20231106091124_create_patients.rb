class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :full_name, null: false
      t.date :date_of_birth, null: false
      t.integer :phone, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
