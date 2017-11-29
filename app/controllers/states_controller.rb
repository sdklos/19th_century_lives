class StatesController < ApplicationController
  load_and_authorize_resource

  def index
    @states = State.alphabetize
    respond_to do |format|
      format.json { render json: @states }
      format.html { render :index }

    end
  end

  def show
    @states = State.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @state }
    end
  end
end
