Given /^I have entered the home page$/ do
  visit "/"
end

Given /^I see "([^"]*)"$/ do |arg1|
  page.should have_content arg1
end

When /^I fill in  "([^"]*)" with "([^"]*)" and$/ do |arg1, arg2|
  fill_in arg1, :with=> arg2
end
When /^I fill in "([^"]*)" with "([^"]*)" and$/ do |arg1, arg2|
  fill_in arg1, :with=> arg2
end


When /^I click "([^"]*)"$/ do |element|
  click_on element
end


When /^I click the "([^"]*)" button$/ do |element|
  click_on element
end

Then /^I should see a list of my task lists$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I enter a user name "([^"]*)"and$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I enter a password "([^"]*)" and$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I click the login button$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)"$/ do |arg1|
page.should have_content arg1

end
