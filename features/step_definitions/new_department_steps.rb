
When(/^I click Oddelki$/) do
  puts current_path
  click_on "Oddelki"
  puts current_path
end

When(/^I click Nov oddelek$/) do
  puts current_path
  click_on "Nov oddelek"
  puts current_path
end

Then(/^I should see Oddelki page$/) do
  puts current_path
  expect(page).to have_current_path "/departments"
end
