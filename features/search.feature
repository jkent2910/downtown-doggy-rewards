Feature: Admin searches for customers 
  As an admin 
  I want to be able to search for customers
  So I can find customers quickly and easily 

  Background: 
    Given I am Carrie
    And the following customers: 
    | first_name | last_name |
    | Julie      | Kent      |
    | Troy       | Renken    |
    | Gary       | Kent      |
    | Adam       | Smith     |
    | Tom        | Smith     |

    And I am signed in  

  Scenario: Admin searches for Kent
    When I search for "Kent"
    Then I should be on the search results page
    And I should see the following customers 
    | first_name | last_name |
    | Julie      | Kent      |
    | Gary       | Kent      |

