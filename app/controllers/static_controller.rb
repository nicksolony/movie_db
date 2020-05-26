class StaticController < ApplicationController
  def home
    @recently_added_movies=Movie.recently_added
    @recently_added_people=Person.recently_added
    @recently_added_reviews=Review.recently_added
  end
end
