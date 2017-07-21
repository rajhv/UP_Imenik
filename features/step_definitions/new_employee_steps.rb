Given(/^I am on new employee page$/) do
  visit "employees/new"
end

When(/^I click Nov zaposlen$/) do
  click_on "Nov zaposlen"
  # save_and_open_page(path = nil)
end
