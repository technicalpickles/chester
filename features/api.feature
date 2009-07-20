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
    Then I should get a YAML list
    And the list of sheets titled "All Cheat Sheets" should include "<exists>"
    And the list of sheets titled "All Cheat Sheets" should not include "<absent>"
    
    Examples:
      | exists     | absent     |
      | tarantulas | bagels     |
      | mopping    | tarantulas |
      | bagels     | mopping    |
      
  Scenario Outline: list recent sheets
    Given a recent sheet exists with a title of "<recent>"
    And an old sheet exists with a title of "<old>"
    And no sheet exists with a title of "<absent>"
    When I ask for recent sheets in YAML
    Then I should get a YAML list
    And the list of sheets titled "Recent Cheat Sheets" should include "<recent>"
    And the list of sheets titled "Recent Cheat Sheets" should not include "<old>"
    And the list of sheets titled "Recent Cheat Sheets" should not include "<absent>"
    
    Examples:
      | recent       | old     | absent       |
      | albatross    | running | applesauce   |
      | dental floss | mice    | albatross    |
      | applesauce   | cups    | dental floss |
      
  Scenario: show an existing sheet
    Given a sheet exists with a title of "brain_surgery_for_dummies"
    And the sheet titled "brain_surgery_for_dummies" has a body of "1: cut open head. 2: ???. 3: Profit!"
    When I ask for the sheet titled "brain_surgery_for_dummies" in YAML
    Then I should get a YAML object titled "brain_surgery_for_dummies"
    And the YAML object titled "brain_surgery_for_dummies" should contain "cut open head"
    And the YAML object titled "brain_surgery_for_dummies" should contain "Profit!"
    
  Scenario: create a new sheet
    Given no sheet exists with a title of "allegory"
    When I use the gem to create a new cheat with a title of "allegory"
    Then I should receive a 201 Created for the "allegory" sheet