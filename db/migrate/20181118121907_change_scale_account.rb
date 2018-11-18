class ChangeScaleAccount < ActiveRecord::Migration[5.1]
  def up 
    change_column :accounts, :debit, :decimal, precision: 25, scale: 10, default: 0
    change_column :accounts, :credit, :decimal, precision: 25, scale: 10, default: 0
    change_column :transactions, :sum, :decimal, precision: 25, scale: 10, default: 0
  end

  def down
    change_column :accounts, :debit, :decimal, precision: 15, scale: 2, default: 0
    change_column :accounts, :credit, :decimal, precision: 15, scale: 2, default: 0
    change_column :transactions, :sum, :decimal, precision: 15, scale: 10, default: 0
  end
end
