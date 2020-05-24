class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director
  belongs_to :writer
  has_many :characters
  has_many :reviews
  has_many :users, through: :reviews
end
