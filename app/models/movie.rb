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
  accepts_nested_attributes_for :movie_genres,:director,:writer, :characters


  # def genres_attributes=(genres_attributes)
  #   if genres_attribute["name"].present?
  #     genre=Genre.find_or_create_by(genres_attributes)
  #     self.genres<genre
  #   end
  # end

  def genres_attributes=(genre_attributes)
   genre_attributes.values.each do |genre_attribute|
     if genre_attribute["name"].present?
       genre = Genre.find_or_create_by(genre_attribute)
      # self.genres << genre
       self.movie_genres.build(genre: genre)
     end
   end
 end

 def director_attributes=(director_attribute)
      if director_attribute[:name].present?
        #director = Person.find_or_create_by(name: director_attribute[:name], dob:director_attribute[:dob])
        if director = Person.find_by(name: director_attribute[:name])
          self.director=director
        else
          self.build_director(director_attribute)
        end
        # if director_attribute[:dob].blank?
        #   director_attribute[:slug] = director_attribute[:name].to_s.parameterize
        # else
        #   director_attribute[:slug] = "#{director_attribute[:name].to_s.parameterize}-##{director_attribute[:dob].to_s.parameterize}"
        # end
        #if @movie.director = Person.find_by(slug: #director_attribute[:slug])
        #  else
        #  @movie.director=Person.create(director_attribute)
        #end
        # if director = Person.find_by(slug: director_attribute[:slug])
        #   self.director=director
        # else
        #    director = Person.create(director_attribute)
        #  end
      end
  end



  # def director_id=(director_id)
  #  self.director = Person.find_by(id: id)
  # end

  #def director_attributes=(director_attributes)
  #  self.build_director(director_attributes)
  #end


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
