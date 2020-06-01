class PeopleController < ApplicationController
  def index
    @people||=Person.order(:name)
    @directors||=@people.select{|person| !person.directed_movies.empty?}
    @writers||=@people.select{|person| !person.written_movies.empty?}
    @actors||=@people.select{|person| !person.characters.empty?}
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
    if person_identify
    else
      redirect_to people_path
    end
  end

  def update
    @person=Person.find(params[:id])
    @person.update(person_params)
    redirect_to person_path(@person.slug)
  end

  def destroy
    if person_identify
      @characters=@person.characters_played
      @characters.each do |character|
        character.destroy
      end
      @person.destroy
      redirect_to people_path
    else
      redirect_to people_path
    end
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
