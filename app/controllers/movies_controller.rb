class MoviesController < ApplicationController

  def index
    @movies=Movie.all.sort_by(&:title)
  end

  def new
    @movie=Movie.new
    @genres=Genre.order(:name)
  end

  def create
    @movie=Movie.new(movie_params)
    binding.pry
    if @movie.save
      redirect_to movie_path(@movie.slug)
    else
      redirect_to new_movie_path, alert: @movie.errors.full_messages
    end
  end

  def show
    @movie=Movie.find_by(:slug=> params[:id])
    @director=@movie.director
    @writer=@movie.writer
    @genres=@movie.genres
    @characters=@movie.characters
  end

  def edit

  end

  def destroy

  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_date, genre_ids:[], genres_attributes: [:name])
  end

end
