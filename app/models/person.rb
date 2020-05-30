class Person < ApplicationRecord
  has_many :characters, :foreign_key=>'actor_id'
  has_many :movies, through: :characters, :foreign_key => 'actor_id'
  has_many :directed_movies, :foreign_key => 'director_id', :class_name=>'Movie'
  has_many :written_movies, :foreign_key => 'writer_id', :class_name=>'Movie'
  validates :name, presence: true
  validates :slug, uniqueness: true
  before_validation :set_slug, only: [:create, :update]

  private
    def set_slug
      if self.dob.present?
        self.slug = "#{name.to_s.parameterize}-#{dob.to_s.parameterize}"
      else
        self.slug = name.to_s.parameterize
      end
    end
end
