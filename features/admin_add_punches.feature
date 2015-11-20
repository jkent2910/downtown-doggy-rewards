Feature: Admin adds punches
  As an Admin
  I want to be able to add punches to a customer's account
  So that I can keep track of their rewards 

  Background:
    Given I am Carrie
    And the following customers:
    | first_name| last_name |
    | Julie     | Kent      |
    | Troy      | Renken    |
    And I am signed in

  Scenario: Admin adds punch to customer
    Given I visit a customer page
    And I follow "Add Punches"
    And I select "Daycare" from "Punch category"
    And I fill in "Punch number" with "1"
    And I press "Create"
    Then I should be on the customer show page
    And I should see "Punch(es) successfully added"