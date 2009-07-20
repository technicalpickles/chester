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
    
  Scenario: attempting to create a new sheet without a title
    Given I am on the homepage
    When I follow "add new"
    And I fill in "title" with ""
    And I fill in "body" with "this sheet has no title"
    And I press "Save"
    Then I should see "Error"
    
  Scenario: attempting to create a new sheet without a body
    Given I am on the homepage
    When I follow "add new"
    And I fill in "title" with "sheet_with_no_body"
    And I fill in "body" with ""
    And I press "Save"
    Then I should see "Error"

  Scenario: viewing all sheets
    Given a sheet exists with a title of "my-awesome-sheet"
    When I go to the homepage
    And I follow "see all"
    Then I should see "my-awesome-sheet"

  Scenario: editing a sheet
    Given a sheet exists with a title of "my-awesome-sheet"
    And I am on the all sheets page
    When I follow "my-awesome-sheet"
    And I follow "Edit"
    And I fill in "body" with "ZOMG JUST PROFIT"
    And I press "Save"
    Then I should see "Sheet updated"
    And I should see "my-awesome-sheet"
    And I should see "ZOMG JUST PROFIT"
    
  Scenario: attempting to remove the title from a sheet
    Given a sheet exists with a title of "ukeleles"
    And I am on the all sheets page
    When I follow "ukeleles"
    And I follow "Edit"
    And I fill in "title" with ""
    And I press "Save"
    Then I should see "Error"
    
  Scenario: attempting to remove the body from a sheet
    Given a sheet exists with a title of "bar_be_cue"
    And I am on the all sheets page
    When I follow "bar_be_cue"
    And I follow "Edit"
    And I fill in "body" with ""
    And I press "Save"
    Then I should see "Error"
