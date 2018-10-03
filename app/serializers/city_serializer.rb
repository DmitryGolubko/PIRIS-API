# == Schema Information
#
# Table name: cities
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class CitySerializer < ActiveModel::Serializer
  attributes :id, :name
end
