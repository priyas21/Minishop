Given("User is on welcome page") do
  visit root_path
end

When("User clicks the {string} Button") do |btn|
  click_button(btn)
end

Then("User should see {string}") do |content|
  expect(page).to have_content(content)
end
