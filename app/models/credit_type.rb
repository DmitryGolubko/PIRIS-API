# == Schema Information
#
# Table name: credit_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CreditType < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
