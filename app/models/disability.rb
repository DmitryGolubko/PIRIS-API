# == Schema Information
#
# Table name: disabilities
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Disability < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
