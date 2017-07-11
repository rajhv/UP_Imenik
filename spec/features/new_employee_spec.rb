require 'rails_helper'
require 'capybara/poltergeist'
require 'capybara/rails'
Capybara.javascript_driver = :poltergeist

RSpec.feature "adding employees", :type => :feature do
  @javascript
  scenario "allow user to add an employee", js: true do
    visit new_employee_path
    save_and_open_page(path = nil)
    find('#mem').click

    select "Rektorat", from:  'mem'


    fill_in "employee_name", with: "Ime"
    fill_in "employee_number", with: "123"
    click_on("Potrdi")

    expect(page.current_path).to be '/employees/new'

  end
end
