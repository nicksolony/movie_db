class Person < ApplicationRecord
  has_many :characters, :foreign_key=>'actor_id'
  has_many :movies, through: :characters
  has_many :directed_movies, :class_name=>'Movie', :foreign_key => 'director_id'
  has_many :written_movies, :class_name=>'Movie', :foreign_key => 'writer_id'
end
