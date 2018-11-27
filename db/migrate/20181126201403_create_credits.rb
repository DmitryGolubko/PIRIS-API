class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.belongs_to :credit_type
      t.belongs_to :currency
      t.integer :duration
      t.decimal :percent, precision: 6, scale: 2
      t.integer :max_amount
    end
  end
end
