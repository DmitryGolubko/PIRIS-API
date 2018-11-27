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

class Credit < ApplicationRecord
  belongs_to :credit_type
  belongs_to :currency

  validates_presence_of :duration, :percent, :max_amount
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

  def name
    "#{currency.code.upcase}, #{credit_type.name}: #{percent}% #{duration} мес."
  end
end
