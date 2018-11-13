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

class DepositType < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  enum revocable: %w[revocable non_revocable]
end
