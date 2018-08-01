Given("I am on signup page") do
  visit new_user_path
end
When("I fills in {string} with {string}") do |field, value|
  fill_in(field, :with => value)
end
When("I clicks the {string} button") do |btn|
  click_button(btn)
end
