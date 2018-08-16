Feature: User registration

  In order to use Minishop
  As a User, I want to be able to register

Scenario: User enters his details
Given I am on signup page
When  I enter my personal details
  And I click on "Continue"
 Then I should see "Property Details"
 When I enter my property details
  And I click on "Continue"
 Then I should see "YOUR DETAILS"
