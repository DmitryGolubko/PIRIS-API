# == Schema Information
#
# Table name: deposit_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  revocable  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DepositTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :revocable
end
