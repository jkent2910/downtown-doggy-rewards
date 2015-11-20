Feature: Admin signs in
  As an admin
  I want to sign in
  So that I can use the application 

  Scenario: admin signs in
    Given I am Carrie 
    And I am on the homepage
    When I sign in
    Then I should be on the admin home page
    And I should see "Signed in successfully."