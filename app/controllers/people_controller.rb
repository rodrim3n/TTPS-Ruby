class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)
    if @person.save
      render json: { person_id: @person.id, person_name: @person.name, person_cui: @person.cui }
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :cui)
  end
end
