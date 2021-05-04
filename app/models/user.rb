class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname
  validates :email, uniqueness:true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :first_name
  validates :first_name_kana
  validates :family_name
  validates :family_name_kana
  validates :birthday
 end
end