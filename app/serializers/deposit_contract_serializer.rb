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

class DepositContractSerializer < ActiveModel::Serializer
  attributes :id, :starts_at, :ends_at, :status, :sum
  belongs_to :client
  belongs_to :deposit
  belongs_to :current_account
  belongs_to :percent_account
end
