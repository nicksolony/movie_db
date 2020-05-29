class Movie < ApplicationRecord

  has_many :movie_genres
  has_many :genres, through: :movie_genres
  belongs_to :director, class_name:"Person", optional: true
  belongs_to :writer, class_name:"Person", optional: true
  has_many :characters
  has_many :actors, :through => :characters, :source => :actor
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  after_validation :set_slug, only: [:create, :update]
  #accepts_nested_attributes_for :genre,:director,:writer, :characters



  #def genre_id=(genre_id)
  #  self.genre = Genre.find_by(id: id)
  #end

  def genres_attributes=(genres_attributes)
    if genres_attribute["name"].present?
      genre=Genre.find_or_create_by(genres_attributes)
      self.genres<genre
    end
  end


  def genres_attributes=(genre_attributes)
   genre_attributes.values.each do |genre_attribute|
     if genre_attribute["name"].present?
       genre = Genre.find_or_create_by(genre_attribute)
       self.genres << genre
       self.post_genres.build(genre: genre)
     end
   end
 end


  #def directors_attributes=(director_attributes)
  #  director=Person.find_or_create_by(director_attributes)
  #  self.director=director
  #end

  #def writers_attributes=(writer_attributes)
  #  writer=Person.find_or_create_by(writer_attributes)
  #  self.writer=writer
  #end

  private
    def set_slug
      self.slug = title.to_s.parameterize
    end

end
