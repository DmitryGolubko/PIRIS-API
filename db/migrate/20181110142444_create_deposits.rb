class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits do |t|
      t.belongs_to :deposit_type
      t.belongs_to :currency
      t.integer :duration
      t.decimal :percent, precision: 6, scale: 2
    end
  end
end
