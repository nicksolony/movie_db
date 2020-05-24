class Person < ApplicationRecord
  has_many :characters, :class_name=>'Person', :foreign_key=>'actor_id'
  has_many :movies, through: :characters
  has_many :movies, :class_name=>'Person', :foreign_key => 'director_id'
  has_many :movies, :class_name=>'Person', :foreign_key => 'writer_id'
end
