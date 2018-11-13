class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.decimal :sum, precision: 15, scale: 2, default: 0
      t.integer :source_account_id
      t.integer :destination_account_id
      t.timestamps
    end
  end
end
