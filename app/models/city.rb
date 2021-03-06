# == Schema Information
#
# Table name: cities
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class City < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  has_many :clients
end
