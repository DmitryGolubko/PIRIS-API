class AddCityToClients < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :city, foreign_key: true, null: false
  end
end
