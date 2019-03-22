require 'rails_helper'

RSpec.describe 'astronaut index page', type: :feature do
  describe 'index astronaut information' do
    it 'shows astronaut infomation' do
      @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create(name: "Ethan Grab", age: 25, job: "Deck Hand")
      @mission_1 = @astronaut_1.missions.create(title: "Apollo 13", time_in_space: 13)
      @mission_2 = @astronaut_1.missions.create(title: "Crapricorn 4", time_in_space: 5)
      @mission_3 = @astronaut_2.missions.create(title: "Gemini 7", time_in_space: 20)
      @mission_4 = @astronaut_2.missions.create(title: "Apollo 13", time_in_space: 100)


      visit astronauts_path

      expect(page).to have_content("Name: #{@astronaut_1.name}")
      expect(page).to have_content("Age: #{@astronaut_1.age}")
      expect(page).to have_content("Job: #{@astronaut_1.job}")

      expect(page).to have_content("Name: #{@astronaut_1.name}")
      expect(page).to have_content("Age: #{@astronaut_1.age}")
      expect(page).to have_content("Job: #{@astronaut_1.job}")
      expect(page).to have_content("Average Age: #{@average_age}")

      expect(page).to have_content("Title: #{@mission_1.title}")
      expect(page).to have_content("Title: #{@mission_2.title}")
      expect(page).to have_content("Title: #{@mission_3.title}")
      expect(page).to have_content("Title: #{@mission_4.title}")


    end
  end




end


# User Story 4 of 4
#
# As a visitor,
# When I visit '/astronauts'
# I see the total time in space for each astronaut.
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander, Total Time in Space: 760 days")
