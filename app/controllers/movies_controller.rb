class MoviesController < ApplicationController
  #before_action :find_movie, only: [:edit, :show, :destroy]

  def index
    @movies=Movie.all
  end

  def new

  end

  def create

  end

  def show
    binding.pry
  end

  def edit

  end

  def destroy

  end

  private

  #def find_movie(params)
  #  binding.pry
  #  @movie=Movie.all
  #end

end
