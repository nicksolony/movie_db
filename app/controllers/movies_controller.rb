class MoviesController < ApplicationController

  def index
    @movies=Movie.all.sort_by(&:title)
  end

  def new
    @movie=Movie.new
  end

  def create
    @movie=Movie.create(movie_params)
    redirect_to movie_path(@movie.slug)
  end

  def show
    @movie=Movie.find_by(:slug=> params[:id])
    @director=@movie.director
    @writer=@movie.writer
    @genre=@movie.genre
  end

  def edit

  end

  def destroy

  end

  private
  def movie_params
    params.require(:movie).permit(:title,:genre_id,:writer_id,:director_id,:release_date)
  end

end
