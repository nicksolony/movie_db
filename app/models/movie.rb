class Movie < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]

  belongs_to :genre, optional: true
  belongs_to :director, class_name:"Person", optional: true
  belongs_to :writer, class_name:"Person", optional: true
  has_many :characters
  has_many :actors, :through => :characters, :source => :actor
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :genre,:director,:writer, :characters



  private
    def set_slug
      self.slug = title.to_s.parameterize
    end

end
