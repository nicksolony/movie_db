class MoviesController < ApplicationController

  def index
    @movies||= Movie.order(:title)
    @genres||= Genre.order(:name)

  end

  def new
    @movie=Movie.new
    @genres=Genre.order(:name)
    #@movie.build_director
  end

  def create
    @movie=Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie.slug)
    # elsif @movie.director.name.empty?
    #     binding.pry
    #     @movie.director=Person.find(movie_params[:director_id].to_i)
    #     binding.pry
    #     @movie.save
    #     redirect_to movie_path(@movie.slug)
      else
      redirect_to new_movie_path, alert: @movie.errors.full_messages
    end
  end

  def show
    if @movie=Movie.find_by(:slug=> params[:id])
      @director=@movie.director
      @writer=@movie.writer
      @genres=@movie.genres
      @characters=@movie.characters
    else
      redirect_to movies_path
    end
  end

  def edit

  end

  def destroy

  end

  private
  def movie_params
    params.require(:movie).permit(:title, :director_id,:release_date, genre_ids:[], genres_attributes: [:name], director_attributes: [:name, :dob])
  end

end
