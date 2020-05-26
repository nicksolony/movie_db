class MoviesController < ApplicationController

  def index
    @movies=Movie.all.sort_by(&:title)
  end

  def new
    @movie=Movie.new
    @movie.build_genre
    @movie.build_writer
    @movie.build_director
  end

  def create
    binding.pry
    @movie=Movie.create(movie_params)
    redirect_to movie_path(@movie.slug)
  end

  def show
    @movie=Movie.find_by(:slug=> params[:id])
    @director=@movie.director
    @writer=@movie.writer
    @genre=@movie.genre
    @characters=@movie.characters
  end

  def edit

  end

  def destroy

  end

  private
  def movie_params
    params.require(:movie).permit(:title,:genre_id,:writer_id,:director_id,:release_date, genre_attributes:[:name],writer_attributes:[:name,:dob])
  end

end
