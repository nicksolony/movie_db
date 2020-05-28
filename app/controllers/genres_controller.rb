class GenresController < ApplicationController
  def index
    @genres=Genre.all.sort_by(&:name)
  end

  def new
    @genre=Genre.new
  end

  def create

      @genre=Genre.new(genre_params)
    if @genre.save

      redirect_to genre_path(@genre.slug)
    else
      #binding.pry
      redirect_to new_genre_path, alert: "Name can't be blank"
    end
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
