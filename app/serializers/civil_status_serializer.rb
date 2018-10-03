# == Schema Information
#
# Table name: civil_statuses
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class CivilStatusSerializer < ActiveModel::Serializer
  attributes :id, :name
end
