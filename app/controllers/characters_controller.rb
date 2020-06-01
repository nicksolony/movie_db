class CharactersController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]

  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def destroy
    @character=Character.find(params[:id])
    @movie=@character.movie
    @character.destroy
    redirect_to movie_path(@movie.slug)
  end
end
