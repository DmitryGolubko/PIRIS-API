# == Schema Information
#
# Table name: countries
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class Country < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
