class StatesController < ApplicationController
  load_and_authorize_resource

  def index
    @states = State.alphabetize
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @states }
    end
  end

  def show
    @states = State.find(params[:id])
  end
end
