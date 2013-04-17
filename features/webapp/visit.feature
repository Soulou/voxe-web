Feature: WEB A normal visit on the website
  Background:
    Given There is a country with the name "France"
    And There is an election in "France" with the name "Election 2012"
    And There are the candidates defined by this table
    	|first_name|last_name|
	|Nicolas   |Sarkozy  |
	|Francois  |Hollande |
    And They run for the election "Election 2012"
    And I am on the homepage

  @javascript @wip
  Scenario: 
    Then I should see all the coutries
    When I click on the country "France"
    Then I should see the elections of "France"
    When I click on the election "Election 2012"
    Then I should see the candidates of "Election 2012"
    When I click on the candidates "Nicolas Sarkozy" and "Francois Hollande"
    Then I should see the categories of the propositions
    # When I click on the category "
