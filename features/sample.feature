@api
Feature: Test that the non-js test runner

  Scenario: The login page exists
    Given I am on "/user"
    Then I should see "Log in"
