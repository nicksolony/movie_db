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
  validates :title, uniqueness: { scope: :release_date}
  after_validation :set_slug, only: [:create, :update]
  accepts_nested_attributes_for :movie_genres,:director,:writer, :characters

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
     if person_find_or_create_by(director_attribute)
       self.director=person
     else
      self.build_director(director_attribute)
     end
   end
 end

  def writer_attributes=(writer_attribute)
      if writer_attribute[:name].present?
        if person_find_or_create_by(writer_attribute)
          self.writer=person
        else
         self.build_writer(writer_attribute)
        end
      end
   end


  private

    def set_slug
      if self.release_date.present?
        self.slug = "#{title.to_s.parameterize}-#{release_date.to_s.parameterize}"
      else
        self.slug = title.to_s.parameterize
      end
    end

    def person_find_or_create_by(attributes)
        if person = Person.find_by(attributes)
          else person = Person.where(dob: nil).find_by(name: attributes[:name])
        end
    end

  #  def director_attributes=(director_attribute)  ### - OLD CODE GOOD FOR DIRECTOR AND WRITER
  #    if director_attribute[:name].present?
  #      if director = Person.find_by(director_attribute)
  #        self.director=director
  #      elsif director = Person.where(dob: nil).find_by(name: #director_attribute[:name])
  #        self.director=director
  #      else
  #       self.build_director(director_attribute)
  #      end
  #    end
  #  end


end
