class AddAttemptsToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :login_attempts, :integer, default: 0
    add_column :accounts, :blocked, :boolean, default: false
  end
end
