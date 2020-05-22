class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :fname, :lname, :fnamekana, :lnamekana,:age, :phonenumber ,presence: true
  has_one :address
end
