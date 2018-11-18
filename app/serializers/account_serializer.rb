# == Schema Information
#
# Table name: accounts
#
#  id           :bigint(8)        not null, primary key
#  client_id    :bigint(8)
#  currency_id  :bigint(8)
#  name         :string
#  number       :string
#  code         :string
#  activity     :integer
#  account_type :integer
#  debit        :decimal(25, 10)  default(0.0)
#  credit       :decimal(25, 10)  default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :code, :activity, :account_type, :debit, :credit
  belongs_to :client
  belongs_to :currency
end
