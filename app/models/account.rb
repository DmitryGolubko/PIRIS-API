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

class Account < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :currency

  after_create :generate_number_and_code

  validates_presence_of :name, :activity, :account_type
  validates_uniqueness_of :number

  has_one :deposit_contract_through_percent,
    class_name: 'DepositContract',
    foreign_key: :percent_account_id,
    inverse_of: :percent_account
  has_one :deposit_contract_through_current,
    class_name: 'DepositContract',
    foreign_key: :current_account_id,
    inverse_of: :current_account

  has_one :credit_contract_through_percent,
    class_name: 'CreditContract',
    foreign_key: :percent_account_id,
    inverse_of: :percent_account
  has_one :credit_contract_through_current,
    class_name: 'CreditContract',
    foreign_key: :current_account_id,
    inverse_of: :current_account

  has_many :transaction_through_source,
    class_name: 'Transaction',
    foreign_key: :source_account_id,
    inverse_of: :source_account

  has_many :transaction_through_destination,
    class_name: 'Transaction',
    foreign_key: :destination_account_id,
    inverse_of: :destination_account

  enum account_type: %w[deposit credit cashbox development_fund]

  enum activity: %w[active passive]

  ACCOUNT_NUMBER_CODES = {
    deposit:               '3014',
    credit:                '2400',
    cashbox:               '1010',
    development_fund:      '7327'
  }.freeze

  def generate_number_and_code
    return unless client_id

    self.number = "#{ACCOUNT_NUMBER_CODES[account_type.to_sym]}#{format('%04d', client_id)}#{format('%04d', id)}1"
    self.code = ACCOUNT_NUMBER_CODES[account_type.to_sym]
    self.pin = rand(1000..9999)
    save
  end

  def balance
    debit + credit
  end
end
