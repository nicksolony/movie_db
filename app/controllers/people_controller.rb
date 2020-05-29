class PeopleController < ApplicationController
  def index
    @people=Person.all.sort_by(&:name)
  end

  def new
    @person=Person.new
  end

  def create
    @person=Person.create(person_params)
    redirect_to person_path(@person.slug)
  end

  def show
    if @person=Person.find_by(:slug=> params[:id])
    else
      redirect_to people_path
    end
  end

  def edit

  end

  def destroy

  end

  private
  def person_params
    params.require(:person).permit(:name,:dob)
  end

end
