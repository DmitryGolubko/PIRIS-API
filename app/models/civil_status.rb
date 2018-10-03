# == Schema Information
#
# Table name: civil_statuses
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class CivilStatus < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
