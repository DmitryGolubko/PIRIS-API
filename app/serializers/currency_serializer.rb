# == Schema Information
#
# Table name: currencies
#
#  id   :bigint(8)        not null, primary key
#  name :string
#  code :string
#

class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :code
end
