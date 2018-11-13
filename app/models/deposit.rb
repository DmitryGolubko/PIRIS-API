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

class Deposit < ApplicationRecord
  belongs_to :deposit_type
  belongs_to :currency

  validates_presence_of :duration, :percent
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

  def name
    "#{currency.code.upcase}, #{deposit_type.name}: #{percent}% #{duration} мес., #{deposit_type.revocable_i18n}"
  end
end
