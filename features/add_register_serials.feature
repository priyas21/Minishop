Feature: Admin Manages User Properties' Register serials

  As an admin i should be able to add register serials
  for user's property

  Scenario: Admin add register serials
    Given Admin is logged in
    When I click on "Manage" link
     And I click on "Manage Property" link
     And I click on "Add Register Serials" link
     And I enter the register serial details
     And I click on "Save"
    Then I should see "Register serial added successfully"
