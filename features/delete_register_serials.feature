Feature: Admin manages removing the register serials

   As an admin i should be able to delete the register
   serials for user's property

   Scenario: Admin deletes the register serials
   Given Admin is logged in
    When I click on "Manage" link
     And I click on "Manage Property" link
     And I click on "Show User Register Serials" link
     And I click on "Delete" link
     Then I should see "Register serial deleted"
