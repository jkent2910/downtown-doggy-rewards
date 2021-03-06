Feature: Admin creates customer
  As an Admin
  I want to create a customer record
  So that I can keep track of their rewards 

  Background:
    Given the following customers:
    | first_name| last_name |
    | Julie     | Kent      |
    | Troy      | Renken    |

  Scenario: Admin creates customer
    Given I am Carrie
    And I am signed in
    And I am on the admin home page 
    And I follow "Add New Customer"
    Then I should be on the new customer page
    When I fill in "First name" with "Julie"
    And I fill in "Last name" with "Kent"
    When I press "Create"
    Then I should be on the customer show page
    And I should see "Customer was successfully created"

  Scenario: Admin edits customer
    Given I am Carrie 
    And I am signed in
    And I visit a customer page
    And I follow "Edit Customer"
    And I fill in "First name" with "Troy"
    And I fill in "Last name" with "Renken"
    When I press "Update"
    Then I should be on the customer show page
    And I should see "Customer successfully updated"

  Scenario: Admin deletes customer
    Given I am Carrie
    And I am signed in
    And I visit a customer page 
    And I follow "Delete Customer"
    Then I should be on the customers index page
    And I should see "Customer successfully deleted"


