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
  validates :title, uniqueness: { scope: :slug}
  before_validation :set_slug, only: [:create, :update]
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
        if director_attribute[:dob].present?
          slug = "#{director_attribute[:name].to_s.parameterize}-#{director_attribute[:dob].to_s.parameterize}"
        else
          slug = director_attribute[:name].to_s.parameterize
        end
        if director = Person.find_by(slug: slug)
          self.director=director
        else
          self.build_director(director_attribute)
        end
      end
  end

  private
    #def set_slug
    #  self.slug = title.to_s.parameterize
    #end
    def set_slug
      if self.release_date.present?
        self.slug = "#{title.to_s.parameterize}-#{release_date.to_s.parameterize}"
      else
        self.slug = title.to_s.parameterize
      end
    end

end
