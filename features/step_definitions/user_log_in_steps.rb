When("I click on {string} link") do |link|
  click_link(link)
end

When("I am on login page") do
  visit login_path
end