class PeopleController < ApplicationController
  load_and_authorize_resource

  def index
    @people = Person.alphabetize
  end

  def new
    @person = Person.new
    @person.parents.build
    @person.parents.build
    @person.children.build
    @person.spouses.build
  end
end
