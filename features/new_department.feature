Feature: Create new department
  As a admin user
  I want to create new department
  So that it accepts employees

  @javascript
  Scenario: Admin creates new department
  Given I am on root page
  And there is member "Članica Testna"
  When I click Oddelki
  And I click Nov oddelek
  And select "Članica Testna" for "mem"
  And write "Oddelek Testni" in the field "department[name]"
  And I click Potrdi
  # And click Nazaj
  Then I should see root page
