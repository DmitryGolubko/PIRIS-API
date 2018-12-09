class AddPinToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :pin, :integer
  end
end
