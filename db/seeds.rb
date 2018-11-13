# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Deposit.destroy_all
DepositType.destroy_all
Currency.destroy_all
Account.destroy_all

DepositType.create!([{ name: 'Альфа-Фикс', revocable: 'revocable' },
                     { name: 'Альфа-Ракета', revocable: 'non_revocable' }])

Currency.create!([{ name: 'Belorussian ruble', code: 'BYN' },
                  { name: 'Euro', code: 'EUR' },
                  { name: 'US Dollars', code: 'USD' },
                  { name: 'Russian rouble', code: 'RUR' }])

currencies = Currency.all
[1, 2, 7, 13, 24, 36, 37, 60].each do |duration|
  currencies.each do |currency|
    Deposit.create!(deposit_type: DepositType.find_by(name: 'Альфа-Фикс'),
                    currency: currency,
                    duration: duration,
                    percent: 12.5)
  end
end

Deposit.create!([{ deposit_type: DepositType.find_by(name: 'Альфа-Ракета'), currency: Currency.find_by(code: 'BYN'),
                   duration: 14, percent: 10 },
                 { deposit_type: DepositType.find_by(name: 'Альфа-Ракета'), currency: Currency.find_by(code: 'BYN'),
                   duration: 14, percent: 12.5 },
                 { deposit_type: DepositType.find_by(name: 'Альфа-Ракета'), currency: Currency.find_by(code: 'BYN'),
                   duration: 24, percent: 10 },
                 { deposit_type: DepositType.find_by(name: 'Альфа-Ракета'), currency: Currency.find_by(code: 'BYN'),
                   duration: 24, percent: 12.5 }])

currencies.each_with_index do |currency, index|
  Account.create!([{ currency: currency, name: "Фонд развития банка, #{currency.code.upcase}",
                     number: "#{Account::ACCOUNT_NUMBER_CODES[:development_fund]}0000000#{index}1",
                     code: Account::ACCOUNT_NUMBER_CODES[:development_fund],
                     activity: :passive, account_type: :development_fund, credit: 100_000_000_000 },

                   { currency: currency, name: "Касса банка, #{currency.code.upcase}",
                     number: "#{Account::ACCOUNT_NUMBER_CODES[:cashbox]}0000000#{index}1",
                     code: Account::ACCOUNT_NUMBER_CODES[:cashbox],
                     activity: :active, account_type: :cashbox }])
end
