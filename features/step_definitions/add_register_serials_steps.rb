When("I enter the register serial details") do
  steps %{
    When I fill in "Meter number" with "654"
     And I fill in "Register number" with "02"
     And I fill in "Register decimals" with "2"
  }
end