# == Schema Information
#
# Table name: clients
#
#  id              :bigint(8)        not null, primary key
#  surname         :string           default(""), not null
#  name            :string           default(""), not null
#  patronymic      :string           default(""), not null
#  birthdate       :date             not null
#  sex             :integer          default(0), not null
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
class ClientSerializer < ActiveModel::Serializer
  attributes :id, :surname, :patronymic, :birthdate, :sex, :passport_series,
             :passport_number, :place_of_issue, :date_of_issue, :id_number,
             :birth_place, :address, :home_phone, :mobile_phone, :email,
             :retired, :salary, :military, :country, :disability,
             :civil_status, :city
end
