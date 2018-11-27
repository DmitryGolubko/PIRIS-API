class CreateCreditContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_contracts do |t|
      t.belongs_to :client
      t.belongs_to :credit
      t.date :starts_at
      t.date :ends_at
      t.integer :status, default: 0
      t.decimal :sum, precision: 15, scale: 2, default: 0
      t.integer :percent_account_id
      t.integer :current_account_id
      t.timestamps
    end
  end
end
