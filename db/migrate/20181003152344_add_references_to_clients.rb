class AddReferencesToClients < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :civil_status, foreign_key: true, null: false
    add_reference :clients, :country, foreign_key: true, null: false
    add_reference :clients, :disability, foreign_key: true, null: false
  end
end
