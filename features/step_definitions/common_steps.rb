Given(/^I am on root page$/) do
  visit "/"
end

Given(/^there is member "([^"]*)"$/) do |member_name|
  FactoryGirl.create(:member, name: member_name)
end

Given(/^there is member "([^"]*)" and department "([^"]*)"$/) do |member_name, department_name|
  FactoryGirl.create(:department, name: department_name, member_name: member_name)
end

# Given(/^there is member "([^"]*)"$/) do |member|
#   @member = FactoryGirl.create(:member, name: member)
# end
#
# Given(/^there is department "([^"]*)"$/) do |department|
#   @department = FactoryGirl.create(:department, name: department).member
# end

Then(/^I should see root page$/) do
  expect(page).to have_current_path "/"
end

Then(/^I should see error page$/) do
  expect(page).to have_text "error"
end

When(/^write "([^"]*)" in the field "([^"]*)"$/) do |text, field|
  puts current_path
  fill_in field, with: text
  puts current_path
end

When(/^I click Potrdi$/) do
  puts current_path
  save_and_open_page(path = nil)
  click_on "Potrdi"
  puts current_path
end

When(/^click Nazaj$/) do
  puts current_path
  click_on "Nazaj"
  puts current_path
end


When(/^select "(.*?)" for "(.*?)"$/) do |option, selection|
  select(option, from: selection)
end

When(/^ajax select "(.*?)" from "(.*?)"$/) do |option, select_box_id|
  # select(option, from: select_box_id)
  selection = page.find(:css, "[id*=#{select_box_id}]")
  selection.select(option)
  wait_for_ajax
end
