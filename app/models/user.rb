class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :fname, :lname, :fnamekana, :lnamekana,:age, :phonenumber ,presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :first_name, presence: true, format: { with: kanjihira }
  # validates :last_name, presence: true, format: { with: kanjihira }
  # validates :first_name_kana, presence: true, format: { with: kana }
  # validates :last_name_kana, presence: true, format: { with: kana }
  has_one :address
end
