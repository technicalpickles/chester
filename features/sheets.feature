Feature: cheat sheets
  In order to cheat at stuff
  I want to be able to create, read, update, and delete cheat sheets

  Scenario: creating a new sheet
    Given I am on the homepage
    When I follow "New sheet"
    And I fill in "title" with "my-awesome-sheet"
    And I fill in "body" with "1) create cheat clone 2) ... 3) PROFIT"
    And I press "Save"
    Then I should see "Sheet created"
    And I should see "1) create cheat clone 2) ... 3) PROFIT"

  Scenario: viewing all sheets
    Given a sheet titled "my-awesome-sheet" exists
    When I go to the homepage
    Then I should see "my-awesome-sheet"
