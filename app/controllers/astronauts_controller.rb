class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average_age = @astronauts.average(:age)
  end

end
