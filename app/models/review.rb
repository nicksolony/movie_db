class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :character
end
