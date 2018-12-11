# == Schema Information
#
# Table name: accounts
#
#  id             :bigint(8)        not null, primary key
#  client_id      :bigint(8)
#  currency_id    :bigint(8)
#  name           :string
#  number         :string
#  code           :string
#  activity       :integer
#  account_type   :integer
#  debit          :decimal(25, 10)  default(0.0)
#  credit         :decimal(25, 10)  default(0.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pin            :integer
#  login_attempts :integer          default(0)
#  blocked        :boolean          default(FALSE)
#

class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :code, :activity, :account_type, :debit, :credit, :client_id
  belongs_to :currency
end
