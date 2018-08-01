Feature: User registration

  In order to use Minishop
  As a User, I want to be able to register

Scenario: Minishop registration with valid input
Given I am on signup page
 When I fills in "First name" with "lilly"
  And I fills in "Surname" with "s"
  And I fills in "Contact phone" with "1234567898"
  And I fills in "Email address" with "lilly@example.com"
  And I clicks the "Continue" button
 Then I should see "property details"

Scenario: Minishop registration with invalid input
Given I am on signup page
 When I fills in "First name" with "p21"
  And I fills in "Surname" with "s"
  And I fills in "Contact phone" with "$1234567898"
  And I fills in "Email address" with "lillyexample.com"
  And I clicks the "Continue" button
 Then I should see "Please enter valid information"
