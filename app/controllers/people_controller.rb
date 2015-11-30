class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.json { render json:  {person: @person}, status: :created }
      else
        format.json { render json:  {errors: @person.errors}, status: :unprocessable_entity }
      end
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :cui)
  end
end
