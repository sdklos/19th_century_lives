class BoroughsController < ApplicationController
  load_and_authorize_resource

  def index
    @boroughs = Borough.alphabetize
  end

  def show
    @borough = Borough.find(params[:id])
  end
end
