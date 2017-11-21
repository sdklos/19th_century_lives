class WelcomeController < ApplicationController
  def home
  end

  def patriarchs_and_matriarchs
    @people = Person.patriarchs_and_matriarchs
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @people }
    end
  end
end
