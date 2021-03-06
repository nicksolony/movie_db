class MoviesController < ApplicationController

  def index
    @movies||= Movie.order(:title)
    @genres||= Genre.order(:name)

  end

  def new
    @movie=Movie.new
    @genres||=Genre.order(:name)
    @people||=Person.order(:name)
    5.times {@movie.characters.build}
    #@movie.build_director
  end

  def create
    @movie=Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie.slug)
    else
      redirect_to new_movie_path, alert: @movie.errors.full_messages
    end
  end

  def show
    if @movie=Movie.find_by(:slug=> params[:id])
      @director=@movie.director
      @writer=@movie.writer
      @genres=@movie.genres.uniq
      @characters=@movie.characters.order(:name)
    else
      redirect_to movies_path
    end
  end

  def edit
    if @movie=Movie.find_by(:slug=> params[:id])
      @genres||=Genre.order(:name)
      @people||=Person.order(:name)
    else
      redirect_to movies_path
    end
  end

  def update
    @movie=Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie.slug)
  end

  def destroy
    if @movie=Movie.find_by(:slug=> params[:id])
      @movie.characters.each do |character|
        character.destroy
      end
      MovieGenre.all.each do |movie_genre|
        if movie_genre.movie == @movie
          movie_genre.destroy
        end
      end
      @movie.destroy
      redirect_to movies_path
    else
      redirect_to movies_path
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :director_id,:writer_id,:release_date, genre_ids:[], genres_attributes: [:name], director_attributes: [:name, :dob],writer_attributes: [:name, :dob],characters_attributes: [:movie_id, :actor_id,:name, actor_attributes:[:name,:dob]])
  end

end
