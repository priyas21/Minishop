Feature: Login

  As a user or admin i would be able to log in
  to my account

Scenario: Login with valid information as a user
Given I am on welcome page
 When I click on "Log in" link
  And I am on login page
  And I fill in "Email address" with "lilly@example.com"
  And I click on "Log in"
 Then I should see "Your Properties"


Scenario: Login with valid information as an admin
  Given I am on welcome page
   When I click on "Log in" link
    And I am on login page
    And I fill in "Email address" with "admin@example.com"
    And I click on "Log in"
   Then I should see "All Users"
