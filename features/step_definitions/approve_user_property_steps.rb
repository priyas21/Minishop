When("I check the Approved checkbox") do
  find("#address_approval_status").click
end

When("I update the user address") do
  steps %{
    When I fill in "Address 1" with "13 Mahoe Street"
     And I fill in "Post code" with "5028"
     And I fill in "ICP Number" with "123ED3456"
  }
end