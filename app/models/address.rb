class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zipcode, :prefecture, :city ,presence: true
end
