Feature: API
  In order to make it really really easy to cheat
  I want to provide an API compatible with the cheat app
  
  Background:
    Given 10 sheets exist
    And 10 recent sheets exist
    And 10 old sheets exist

  Scenario Outline: list all sheets
    Given a sheet exists with a title of "<exists>"
    And no sheet exists with a title of "<absent>"
    When I ask for all sheets in YAML
    Then I should get a YAML list of all cheat sheets
    And the list of sheets should include "<exists>"
    And the list of sheets should not include "<absent>"
    
    Examples:
      | exists     | absent     |
      | tarantulas | bagels     |
      | mopping    | tarantulas |
      | bagels     | mopping    |