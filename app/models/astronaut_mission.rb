class AstronautMission < ApplicationRecord
  belongs_to :astronaut
  belongs_to :mission
end
