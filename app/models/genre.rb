class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies,  through: :movie_genres
  validates :name, presence: true
  after_validation :set_slug, only: [:create, :update]


  private
    def set_slug
      self.slug = name.to_s.parameterize
    end
end
