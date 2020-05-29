class Person < ApplicationRecord
  has_many :characters, :foreign_key=>'actor_id'
  has_many :movies, through: :characters, :foreign_key => 'actor_id'
  has_many :directed_movies, :foreign_key => 'director_id', :class_name=>'Movie'
  has_many :written_movies, :foreign_key => 'writer_id', :class_name=>'Movie'
  validates :name, presence: true
  validates :name, uniqueness: true
  after_validation :set_slug, only: [:create, :update]

  private
    def set_slug
      self.slug = name.to_s.parameterize

    end
end
