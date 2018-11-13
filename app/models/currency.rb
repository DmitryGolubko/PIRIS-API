# == Schema Information
#
# Table name: currencies
#
#  id   :bigint(8)        not null, primary key
#  name :string
#  code :string
#

class Currency < ApplicationRecord
  validates_presence_of :name, :code
  validates_uniqueness_of :name, :code, case_sensitive: false
end
