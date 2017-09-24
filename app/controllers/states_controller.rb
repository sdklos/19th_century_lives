class StatesController < ApplicationController
  load_and_authorize_resource

  def index
    @states = State.alphabetize
  end

  def show
    @states = State.find(params[:id])
  end
end
