Given("Admin is logged in") do
  visit login_path
  fill_in("Email address", :with => "admin@example.com")
  click_button("Log in")
end

When("I check the {string} checkbox") do |approved|
  check(approved)
end