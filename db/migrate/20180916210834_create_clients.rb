class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :surname, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :patronymic, null: false, default: ''
      t.date :birthdate, null: false, default: ''
      t.integer :sex, null: false, default: 0
      t.string :passport_series, null: false, default: ''
      t.string :passport_number, null: false, default: ''
      t.string :place_of_issue, null: false, default: ''
      t.date :date_of_issue, null: false, default: ''
      t.string :id_number, null: false, default: ''
      t.string :birth_place, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :home_phone, null: false, default: ''
      t.string :mobile_phone, null: false, default: ''
      t.string :email, null: false, default: ''
      t.boolean :retired, null: false, default: false
      t.integer :salary, null: false, default: 0
      t.boolean :military, null: false, default: false
      t.timestamps
    end
  end
end
