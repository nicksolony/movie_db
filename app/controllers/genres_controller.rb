class GenresController < ApplicationController
  def index
    @genres=Genre.all.sort_by(&:name)
  end

  def new
    @genre=Genre.new
  end

  def create
    @genre=Genre.create(genre_params)
    redirect_to genre_path(@genre.slug)
  end

  def show
    @genre=Genre.find_by(:slug=> params[:id])
    @genre_movies = @genre.movies.all.sort_by(&:title)
  end

  def edit

  end

  def destroy

  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
