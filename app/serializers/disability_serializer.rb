# == Schema Information
#
# Table name: disabilities
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class DisabilitySerializer < ActiveModel::Serializer
  attributes :id, :name
end
