require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

  describe('path for index', {:type => :feature}) do
    it('shows the link to list of cars and "add car" form') do
      visit('/')
      expect(page).to have_content('Welcome to')
    end
  end

  describe('path for all vehicles', {:type => :feature}) do
    it('shows the list of all available ') do
      visit('/vehicles')
      expect(page).to have_content('Here are')
    end
  end

  describe('path for all vehicles', {:type => :feature}) do
    it('allows user to input a new vehicle ') do
      visit('/vehicles_form')
      fill_in('make', :with => 'Ford')
      fill_in('model', :with => 'Mustang')
      fill_in('year', :with => '1999')
      click_button('Add Vehicle')
      expect(page).to have_content('success')
    end
  end

  describe('path for all vehicles', {:type => :feature}) do
    it('shows the list of all available ') do
      visit('/vehicles')
      fill_in('make', :with => 'Mini')
      fill_in('model', :with => 'Cooper')
      fill_in('year', :with => '1999')
      click_button('Add Vehicle')
      expect(page).to have_content('success')
      click_link('See Vehicle List')
      expect(page).to have_content('Vehicles')
      click_link("Cooper")
      expect(page).to have_content('Mini')
    end
end
