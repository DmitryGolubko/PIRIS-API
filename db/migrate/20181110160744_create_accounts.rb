class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :client
      t.belongs_to :currency
      t.string :name
      t.string :number
      t.string :code
      t.integer :activity
      t.integer :account_type
      t.decimal :debit, precision: 15, scale: 2, default: 0
      t.decimal :credit, precision: 15, scale: 2, default: 0
      t.timestamps
    end
  end
end
