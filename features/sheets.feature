Feature: cheat sheets
  In order to cheat at stuff
  I want to be able to create, read, update, and delete cheat sheets

  Scenario: creating a new sheet
    Given I am on the homepage
    When I follow "add new"
    And I fill in "title" with "my-awesome-sheet"
    And I fill in "body" with "1) create cheat clone 2) ... 3) PROFIT"
    And I press "Save"
    Then I should see "Sheet created"
    And I should see "my-awesome-sheet"
    And I should see "1) create cheat clone 2) ... 3) PROFIT"

  Scenario: viewing all sheets
    Given a sheet titled "my-awesome-sheet" exists
    When I go to the homepage
    And I follow "see all"
    Then I should see "my-awesome-sheet"

  Scenario: editing a sheet
    Given a sheet titled "my-awesome-sheet" exists
    And I am on the all sheets page
    When I follow "my-awesome-sheet"
    And I follow "Edit"
    And I fill in "body" with "ZOMG JUST PROFIT"
    And I press "Save"
    Then I should see "Sheet updated"
    And I should see "my-awesome-sheet"
    And I should see "ZOMG JUST PROFIT"
