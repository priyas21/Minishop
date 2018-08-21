Feature: Admin Manages User Properties

As an admin i should be able to approve
user property details

Scenario: Admin approves user property
Given Admin is logged in
When I click on "Manage" link
 And I click on "Manage Property" link
 And I should see "User Details"
 And I click on "Approve User Property" link
 And I should see "Update Profile"
 And I check the "Approved" checkbox
Then I should see "Address Updated"
 And I should see "Approved"
