Given("I am on welcome page") do
  visit root_path
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, :with => value)
end

When("I click on {string}") do |btn|
  click_button(btn)
end

Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end