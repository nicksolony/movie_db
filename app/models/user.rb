class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_secure_password
  has_many :reviews
  has_many :movies, through: :reviews
  has_many :actors, through: :characters
end
