class PeopleController < ApplicationController
  load_and_authorize_resource

  def index
    @people = Person.alphabetize
  end
end
