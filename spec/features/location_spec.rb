require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("Galvanize")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do
    
    @location = Location.create(:name => 'g6', :address => "1062 delaware", :zipcode => 91292)
    visit "/locations/#{@location.id}"


    expect(page).to have_content("g6")

  end

  scenario 'User can edit a location' do

    visit '/'

    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "boston"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_button "Create Location"

    click_on "Edit"

    fill_in 'location[name]', :with => "denver"
    fill_in 'location[address]', with: "777 lucky"
    fill_in 'location[zipcode]', with: "80221"

    click_on "Update Location"

    expect(page).to have_content("denver")

    
  end


  scenario 'User can delete a location' do

    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on "Delete"

    expect(page).to have_no_content("Galvanize")


  end






end
