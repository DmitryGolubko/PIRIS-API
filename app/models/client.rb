# == Schema Information
#
# Table name: clients
#
#  id              :bigint(8)        not null, primary key
#  surname         :string           default(""), not null
#  name            :string           default(""), not null
#  patronymic      :string           default(""), not null
#  birthdate       :date             not null
#  sex             :integer          default("male"), not null
#  passport_series :string           default(""), not null
#  passport_number :string           default(""), not null
#  place_of_issue  :string           default(""), not null
#  date_of_issue   :date             not null
#  id_number       :string           default(""), not null
#  birth_place     :string           default(""), not null
#  address         :string           default(""), not null
#  home_phone      :string           default(""), not null
#  mobile_phone    :string           default(""), not null
#  email           :string           default(""), not null
#  retired         :boolean          default(FALSE), not null
#  salary          :integer          default(0), not null
#  military        :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint(8)        not null
#  civil_status_id :bigint(8)        not null
#  country_id      :bigint(8)        not null
#  disability_id   :bigint(8)        not null
#

class Client < ApplicationRecord
  validates_presence_of :surname, :name, :patronymic, :birthdate, :passport_series, :passport_number, :place_of_issue,
    :date_of_issue, :id_number, :birth_place, :address, :sex
  validates :salary, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_date :birthdate, :date_of_issue, on_or_before: :today
  validates_format_of :passport_number, with: /\A[0-9]{7}\Z/
  validates_format_of :passport_series, with: /\A[a-zA-Z]{2}\Z/
  validates_format_of :id_number, with: /\A[0-9]{7}[a-zA-Z]{1}[0-9]{3}[a-zA-Z]{2}[0-9]{1}\Z/
  validates_format_of :home_phone, :mobile_phone, with: /\A(\Z|[\+][0-9]{12})\Z/
  validates :id_number, uniqueness: true
  validates_uniqueness_of :passport_number, scope: :passport_series
  validates :email, :home_phone, :mobile_phone, uniqueness: true, allow_blank: true
  belongs_to :city
  belongs_to :country
  belongs_to :civil_status
  belongs_to :disability
  has_one :deposit_contract
  has_many :accounts
  enum sex: %w[male female]

  def full_name
    "#{surname.capitalize} #{name.capitalize} #{patronymic.capitalize}"
  end
end
