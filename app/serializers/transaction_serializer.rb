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

class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :sum
  belongs_to :source_account
  belongs_to :destination_account
end
