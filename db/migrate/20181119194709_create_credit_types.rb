class CreateCreditTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_types do |t|
      t.string :name
      t.integer :pay_type
      t.timestamps
    end
  end
end
