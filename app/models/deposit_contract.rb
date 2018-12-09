# == Schema Information
#
# Table name: deposit_contracts
#
#  id                 :bigint(8)        not null, primary key
#  client_id          :bigint(8)
#  deposit_id         :bigint(8)
#  starts_at          :date
#  ends_at            :date
#  status             :integer          default("opened")
#  sum                :decimal(15, 2)   default(0.0)
#  percent_account_id :integer
#  current_account_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DepositContract < ApplicationRecord
  belongs_to :client
  belongs_to :deposit
  belongs_to :current_account, class_name: 'Account', optional: true
  belongs_to :percent_account, class_name: 'Account', optional: true

  validates_presence_of :client, :deposit, :starts_at, :sum
  validates :sum, numericality: { greater_than: 0 }
  enum status: %w[opened closed]
end
