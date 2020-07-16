@api
Feature: Test the JS test runner

  @javascript
  Scenario:
    Given I am on "/user"
    Then I should see "Log in"

  @javascript
  Scenario:
    Given I am logged in as a user with the "administrator" role
    And I am at "/node/add/article"
    And I enter "Test title!" for "Title"
    And I attach the file "cat.jpeg" to "Image"
    And I wait for AJAX to finish
    And I enter "A fluffy cat" for "Alternative text"
    And I press the "Save" button
    Then I should see "Test title!"
