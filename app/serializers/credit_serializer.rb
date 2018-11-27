# == Schema Information
#
# Table name: credits
#
#  id             :bigint(8)        not null, primary key
#  credit_type_id :bigint(8)
#  currency_id    :bigint(8)
#  duration       :integer
#  percent        :decimal(6, 2)
#  max_amount     :integer
#

class CreditSerializer < ActiveModel::Serializer
  attributes :id, :duration, :percent, :name, :max_amount
  belongs_to :credit_type
  belongs_to :currency
end
