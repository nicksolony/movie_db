class CharactersController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]

  def index

  end

  def new
    @movie=Movie.find_by(slug: params[:movie_id])
    @people||=Person.order(:name)
    @character=Character.new(movie_id: @movie.id)
  end

  def create
      @character=Character.new(characters_params)
      if @character.save
        redirect_to movie_path(params[:movie_id])
      else
        redirect_to new_movie_character_path(params[:movie_id]), alert: @character.errors.full_messages
      end
  end

  def show

  end

  def edit

  end

  def destroy
    @character=Character.find(params[:id])
    @character.destroy
    redirect_to movie_path(params[:movie_id])
  end

  private
  def characters_params
    params.require(:character).permit(:movie_id,:actor_id,:name, actor_attributes:[:name,:dob])
  end

end
