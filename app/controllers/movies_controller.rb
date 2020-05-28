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
      redirect_to new_movie_path, alert: "Title can't be blank"
    end
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
    params.require(:movie).permit(:title,:genre_id,:writer_id,:director_id,:release_date, genre_attributes:[:id,:name],writer_attributes:[:name,:dob],director_attributes:[:name,:dob])
  end

end
