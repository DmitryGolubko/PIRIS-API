# == Schema Information
#
# Table name: deposits
#
#  id              :bigint(8)        not null, primary key
#  deposit_type_id :bigint(8)
#  currency_id     :bigint(8)
#  duration        :integer
#  percent         :decimal(6, 2)
#

class DepositSerializer < ActiveModel::Serializer
  attributes :id, :duration, :percent, :name
  belongs_to :deposit_type
  belongs_to :currency
end
