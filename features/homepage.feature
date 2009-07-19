Feature: homepage
  In order to encourage others to cheat
  I want to be able to facilitate navigation to cheat sheets
  
  Scenario Outline: the updated-sheets sidebar
    Given there are more than enough sheets to fill the "updated sheets" sidebar
    And a recent sheet exists with a title of "<recent>"
    And an old sheet exists with a title of "<old>"
    When I go to the homepage
    Then I should see "<recent>" in the "updated sheets" sidebar
    And I should not see "<old>" in the "updated sheets" sidebar
    
    Examples:
      | recent |   old  |
      | banana | thrush |
      | carp   | banana |
      | thrush | monkey |