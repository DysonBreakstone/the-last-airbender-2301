require 'rails_helper'

RSpec.describe "fire nation residents and details" do
  describe "Welcome Page", :vcr do
    it "display" do
      visit "/"

      expect(page).to have_selector("select#nation")
      expect(page).to have_button("Search For Members")
    end

    it "search button", :vcr do
      visit "/"

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      expect(current_path).to eq("/search")
    end
  end
  
  describe "Search page" do
    it "display", :vcr do
      visit "/"

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      expect(page).to have_content("Total Residents: 97")
    end

    it "character information", :vcr do
      visit "/"

      select "Fire Nation", from: "nation"
      click_on "Search For Members" 
      
      save_and_open_page
      expect(page).to have_content("Name", count: 25)
      expect(page).to have_content("Allies", count: 25)
      expect(page).to have_content("Enemies", count: 25)      
      expect(page).to have_content("Affiliations", count: 25)      
    end
  end
end