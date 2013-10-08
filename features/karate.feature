Feature: Traditional Karate
	
Scenario Outline: Where is the master?

	Given I navigate to Google
	When I enter <searchPerson> into the search field
	Then the text <personSurname> should be present  
	
	Examples:
	| searchPerson  | personSurname|
	| Narendra      | Modi         |
	| Shagun        | Quora        |
	| Shahrukh      | Khan         |
	| Aamir Raza    | Hussain      |
	| Akshay        | Kumar        |