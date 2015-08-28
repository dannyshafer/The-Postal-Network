class Stamp < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600", medium: "300x300", small: "150x150#",}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  has_one :country
  has_one :condition
  has_one :currency
  has_many :comments
end
