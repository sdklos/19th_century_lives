class NeighborhoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @neighborhoods = Neighborhood.alphabetize
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)
    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully created.'}
        format.json {render action: 'show', status: :created, location: @neighborhood}
      else
        format.html {render action: 'new'}
        format.json {render json: @person.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.update(neighborhood_params)
    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully created.'}
        format.json {render action: 'show', status: :created, location: @neighborhood}
      else
        format.html {render action: 'new'}
        format.json {render json: @person.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :borough_id, :comments)
  end
end
