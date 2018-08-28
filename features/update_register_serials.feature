Feature: Admin Manages editing register serials

As an admin i should be able to edit register serials
for user's property

  Scenario: Admin edits the register serials
    Given Admin is logged in
     When I click on "Manage" link
      And I click on "Manage Property" link
      And I click on "Show User Register Serials" link
      And I click on "Update" link
      And I should see "Update Register Serials"
      And I update register serials
      And I click on "Save changes"
     Then I should see "Register Serials Updated"
