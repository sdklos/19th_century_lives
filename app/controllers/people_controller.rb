require 'pry'

class PeopleController < ApplicationController
  load_and_authorize_resource

  def index
    @people = Person.alphabetize
  end

  def new
    @person = Person.new
    @person.build_associations
  end

  def create
    puts params
    @person = Person.new(person_params)
    @person.creator_id = current_user.id
    @person.save_associations

  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
    @person.build_associations
  end

  def update
    @person.save_associations
  end

  private

  def person_params
    params.require(:person).permit(:name, :given_name, :year_of_birth, :year_of_death, :comments, :parent_ids => [], :child_ids => [], :spouse_ids => [], :neighborhood_ids => [], :parents_attributes => [:name, :given_name, :year_of_birth, :year_of_death, :comments], :children_attributes => [:name, :given_name, :year_of_birth, :year_of_death, :comments], :spouses_attributes => [:name, :given_name, :year_of_birth, :year_of_death, :comments], :neighborhoods_attributes => [:name, :borough_id, :comments])
  end
end
