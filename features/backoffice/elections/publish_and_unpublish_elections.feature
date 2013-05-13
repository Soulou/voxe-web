Feature: BACKOFFICE Publish and unpublish elections

  Background:
    Given I am a logged admin

  @javascript
  Scenario: Unpublish election
    Given There is a published election
    And I am on the elections page
    When I click on "Publié" button
    Then I should see "Non publié" on the page
    And The election should be unpublished

  @javascript
  Scenario: Publish an election
    Given There is an unpublished election
    And I am on the elections page
    When I click on "Non publié" button
    Then I should see "Publié" on the page
    And The election should be published
