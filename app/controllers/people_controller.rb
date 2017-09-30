require 'pry'

class PeopleController < ApplicationController
  load_and_authorize_resource

  def index
    @people = Person.alphabetize
  end

  def patriarchs_and_matriarchs
    @people = Person.patriarchs_and_matriarchs
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        @person.persist_relationships
        format.html { redirect_to @person, notice: 'Person was successfully created.'}
        format.json {render action: 'show', status: :created, location: @person}
      else
        format.html {render action: 'new'}
        format.json {render json: @person.errors, status: :unprocessable_entity}
      end
    end

  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    @person.persist_relationships
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.'}
        format.json {render action: 'show', status: :created, location: @person}
      else
        format.html {render action: 'new'}
        format.json {render json: @person.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:name, :given_name, :year_of_birth, :year_of_death, :comments, :creator_id, :parent_ids => [], :child_ids => [], :spouse_ids => [], :city_ids => [], :parents_attributes => [:name, :given_name, :year_of_birth, :year_of_death, :comments, :creator_id], :children_attributes => [:name, :given_name, :year_of_birth, :year_of_death, :comments, :creator_id], :spouses_attributes => [:name, :given_name, :year_of_birth, :year_of_death, :comments, :creator_id], :cities_attributes => [:name, :state_id, :comments])
  end
end
