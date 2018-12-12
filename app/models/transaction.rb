# == Schema Information
#
# Table name: transactions
#
#  id                     :bigint(8)        not null, primary key
#  sum                    :decimal(25, 10)  default(0.0)
#  source_account_id      :integer
#  destination_account_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Transaction < ApplicationRecord
  belongs_to :source_account, class_name: 'Account', optional: true
  belongs_to :destination_account, class_name: 'Account', optional: true

  validates_presence_of :sum
  validates :sum, numericality: { greater_or_equal_than: 0 }

  after_create :make_destination_transaction, :make_source_transaction

  def make_destination_transaction
    return if destination_account.nil?

    if destination_account.active?
      destination_account.debit += sum
    else
      destination_account.credit += sum
    end
    destination_account.save
  end

  def make_source_transaction
    return if source_account.nil?

    if source_account.active?
      source_account.credit -= sum
    else
      source_account.debit -= sum
    end
    source_account.save
  end
end
