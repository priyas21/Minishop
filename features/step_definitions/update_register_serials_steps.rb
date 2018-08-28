When("I update register serials") do
  steps %{
    When I fill in "Meter number" with "666"
     And I fill in "Register decimals" with "4"
  }
end