Feature: WEB Visit voxe.org homepage
  Background:
    Given I am on the homepage

  Scenario: The title must be correct
    Then I should see "Voxe.org" as title of the page

  @javascript
  Scenario: Must be able to ask to add a country
    Then I should see "Add your country" on the page
    And The "Add your country" link should target "https://docs.google.com"
