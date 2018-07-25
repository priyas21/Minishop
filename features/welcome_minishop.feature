Feature: Welcome user to Minishop

   As an admin i want the user to
   be greeted by welcome message
   User would be able to sign up

   Scenario: Sign up to minishop
   Given User is on welcome page
    When User clicks the "Sign Up" Button
    Then User should see "Minishop Registration"
