Feature: Create new member
  As a admin user
  I want to create new member
  So that it accepts departments and eventually employees

  @javascript
  Scenario: Admin creates new member
  Given I am on root page
  When I click Članice
  And I click Nova članica
  And write "Testna članica" in the field "member[name]"
  And click Potrdi
  Then I should see root page
