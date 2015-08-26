class Stamp < ActiveRecord::Base
  belongs_to :user
  has_one :country
  has_one :condition
  has_one :currency
  has_many :comments
end
