class Person < ApplicationRecord
  has_many :characters, :foreign_key=>'actor_id'
  has_many :movies, through: :characters, :foreign_key => 'actor_id'
  has_many :directed_movies, :foreign_key => 'director_id', :class_name=>'Movie'
  has_many :written_movies, :foreign_key => 'writer_id', :class_name=>'Movie'
end
