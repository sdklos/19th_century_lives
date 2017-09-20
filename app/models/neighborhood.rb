class Neighborhood < ApplicationRecord
  extend Alphabetizable

  belongs_to :borough, optional: true
  has_many :person_neighborhoods
  has_many :people, through: :person_neighborhoods

  validates :name, :borough_id, presence: true

  def display
    "#{self.name} (#{self.borough.name})"
  end

  def save_associations
    respond_to do |format|
      if self.save
        format.html { redirect_to person_path(self), notice: 'Neighborhood was successfully created.'}
        format.json {render action: 'show', status: :created, location: neighborhood_path(self)}
      else
        format.html {render action: 'new'}
        format.json {render json: self.errors, status: :unprocessable_entity}
      end
    end
  end
end
