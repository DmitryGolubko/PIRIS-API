class CreateCivilStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :civil_statuses do |t|
      t.string :name
    end
  end
end
