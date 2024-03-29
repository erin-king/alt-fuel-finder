require 'rails_helper'

describe "As a user" do
  it "can fill in search form with 80206, click and see total results" do
    visit '/'
    # And I fill in the search form with 80206 (Note: Use the existing search form)
    fill_in :q, with: '80206'
    # And I click "Locate"
    click_button "Locate"
    # Then I should be on page "/search"
    expect(current_path).to eq(search_path)
    # expect(current_path).to eq('/search')

    # Then I should see the total results of the stations that match my query, 90.
    expect(page).to have_css('.total-results', count: 93) #old story says 90
    # Then I should see a list of the 15 closest stations within 5 miles sorted by distance
    expect(page).to have_css('.closest-results', count: 15)
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to have_content("Name:")
    expect(page).to have_content("Address:")
    expect(page).to have_content("Fuel Types:")
    expect(page).to have_content("Distance:")
    expect(page).to have_content("Access Times:")
  end
end

#2 and 3 from bottom
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
