Feature: cheat sheets
  In order to encourage others to cheat
  I want to be able to facilitate navigation to cheat sheets
  
  Scenario Outline: the updated-sheets sidebar
    Given there are more than enough sheets to fill the "updated sheets" sidebar
    And the sheet titled "<recent>" was recently edited
    And the sheet titled "<old>" was not recently edited
    When I go to the homepage
    Then I should see "<recent>" in the "updated sheets" sidebar
    And I should not see "<old>" in the "updated sheets" sidebar
    
    Examples:
      | recent |   old  |
      | banana | thrush |
      | carp   | banana |
      | thrush | monkey |