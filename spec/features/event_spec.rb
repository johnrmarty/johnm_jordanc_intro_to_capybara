require 'rails_helper'


describe 'User can CRUD an event' do 

	before :each do 
		@my_location = Location.create(name: 'boston', address: '555 west dr', zipcode: 66622)
		visit "/locations/#{@my_location.id}"
	end 
	

	scenario 'Users can create an event' do
		click_on "New Event"

		 fill_in 'event[description]', with:  "dancing"
     	 fill_in 'event[date]', with: 2016-03-12
     	 page.check('event[requires_id]')

     	 click_on "Create Event"
		

		 expect(page).to have_content('dancing')
	end

	scenario 'Users can see show page for an event' do

	click_on "New Event"

		 fill_in 'event[description]', with:  "dancing"
     	 fill_in 'event[date]', with: 2016-03-12
     	 page.check('event[requires_id]')

     	 click_on "Create Event"

     	 click_on "dancing"


     	 expect(page).to have_content('dancing')

     	end

	scenario "Users can edit an event" do


		click_on "New Event"

		 fill_in 'event[description]', with:  "dancing"
     	 fill_in 'event[date]', with: 2016-03-12
     	 page.check('event[requires_id]')

     	 click_on "Create Event"

     	 click_on "Edit" 

     	 fill_in 'event[description]', with:  "swimming"
     	 fill_in 'event[date]', with: 2016-03-12
     	 page.check('event[requires_id]')

     	 click_on "Update Event"

     	 expect(page).to have_content("swimming")

	end

	scenario "Users can delete and event" do


		click_on "New Event"

		 fill_in 'event[description]', with:  "dancing"
     	 fill_in 'event[date]', with: 2016-03-12
     	 page.check('event[requires_id]')

     	 click_on "Create Event"

     	 click_on "Delete"

     	 expect(page).to have_no_content("dancing")
	end
end


  # create_table "events", force: :cascade do |t|
  #   t.string  "description"
  #   t.date    "date"
  #   t.boolean "requires_id"
  #   t.integer "location_id"
  # end