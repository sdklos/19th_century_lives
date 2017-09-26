class City < ApplicationRecord
  extend Validation
  
  belongs_to :state
  has_many :person_cities
  has_many :people, through: :person_cities

  validates :name, :state_id, presence: true
  validates :name, uniqueness: { scope: :state_id }

  def display
    "#{self.name} (#{self.state.name})"
  end

  def self.alphabetize
    self.order(:name)
  end

  def save_associations
    respond_to do |format|
      if self.save
        format.html { redirect_to person_path(self), notice: 'City was successfully created.'}
        format.json {render action: 'show', status: :created, location: city_path(self)}
      else
        format.html {render action: 'new'}
        format.json {render json: self.errors, status: :unprocessable_entity}
      end
    end
  end
end
