class PeopleController < ApplicationController
  def index
    binding.pry
    @people=Person.order(:name)
    @directors=Person.where(directed_movies: true)
  end

  def new
    @person=Person.new
  end

  def create
    @person=Person.create(person_params)
    redirect_to person_path(@person.slug)
  end

  def show
    if person_identify
      @characters=@person.characters_played
      @written_movies=@person.written_movies
      @directed_movies=@person.directed_movies
    else
      redirect_to people_path
    end
  end

  def edit

  end

  def destroy

  end

  def directed_movies
    if person_identify
      if !@person.directed_movies.empty?
        @movies=@person.directed_movies
      else
        redirect_to person_path(@person.slug)
      end
    else
      redirect_to people_path
    end
  end

  def written_movies
    if person_identify
      if !@person.written_movies.empty?
        @movies=@person.written_movies
      else
        redirect_to person_path(@person.slug)
      end
    else
      redirect_to people_path
    end
  end

  def filmography
    if person_identify
      if !@person.characters_played.empty?
        @characters=@person.characters_played
      else
        redirect_to person_path(@person.slug)
      end
    else
      redirect_to people_path
    end
  end

  private

  def person_identify
    @person||=Person.find_by(:slug=> params[:id])
  end

  def person_params
    params.require(:person).permit(:name,:dob)
  end

end
