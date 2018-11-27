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
  attributes :id, :sum, :source_account_id, :destination_account_id, :created_at
end
