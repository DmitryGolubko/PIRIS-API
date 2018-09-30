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
#  civil_status    :integer          default("single"), not null
#  country         :string           default(""), not null
#  disabled        :boolean          default(FALSE), not null
#  retired         :boolean          default(FALSE), not null
#  salary          :integer          default(0), not null
#  military        :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint(8)
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
