class NeighborhoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @neighborhoods = Neighborhood.alphabetize
  end
end
