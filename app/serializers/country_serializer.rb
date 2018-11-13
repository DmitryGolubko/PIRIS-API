# == Schema Information
#
# Table name: countries
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name
end
