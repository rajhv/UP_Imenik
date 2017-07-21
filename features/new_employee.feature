Feature: Create new employee
  As a admin user
  I want to create new employee
  So that it can be searchable

  @javascript
  Scenario: Admin creates new employee
  Given I am on root page
  And there is member "m" and department "O"
  When I click Nov zaposlen
  And select "m" for "mem"
  And select "O" for "dep"
  And write "Vojko" in the field "employee[name]"
  And write "520" in the field "employee[number]"
  When I click Potrdi
  Then I should see root page
