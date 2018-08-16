Given("I am on signup page") do
  visit new_user_path
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, :with => value)
end
When("I click on {string}") do |btn|
  click_button(btn)
end

When("I enter my personal details") do
  steps %{
    When I fill in "First name" with "p21"
     And I fill in "Surname" with "s"
     And I fill in "Contact phone" with "1234567898"
     And I fill in "Email address" with "lilly@example.com"
  }
end

When("I enter my property details") do
  steps %{
    When I fill in "Address 1" with "19A mahoe st"
     And I fill in "City" with "Wellington"
     And I fill in "District" with "Porirua"
     And I fill in "Suburb" with "Tawa"
     And I fill in "Post code" with "1234"
  }
end
