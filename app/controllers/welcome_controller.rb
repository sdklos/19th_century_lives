class WelcomeController < ApplicationController
  def home
  end

  def patriarchs_and_matriarchs
    @people = Person.patriarchs_and_matriarchs
  end
end
