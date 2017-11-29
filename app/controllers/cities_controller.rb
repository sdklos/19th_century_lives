class CitiesController < ApplicationController
  load_and_authorize_resource

  def index
    @cities = City.alphabetize
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @cities }
    end
  end

  def new
    @city = City.new
    @city.people.build
  end

  def create
    @city = City.new(city_params)
    respond_to do |f|
      if @city.save
        f.json {render :json => @city}
        f.html { redirect_to @city, notice: 'City was successfully created.'}

      else
        format.html {render action: 'new'}
        format.json {render json: @city.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @city = City.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @city }
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully updated.'}
        format.json {render action: 'show', status: :created, location: @city}
      else
        format.html {render action: 'new'}
        format.json {render json: @city.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :state_id, :person_ids => []).reject { |k, v| v.blank? }
  end
end
