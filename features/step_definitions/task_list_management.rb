Given /^Logged in as valid user\.$/ do
  
end

Given /^I am on the home page$/ do
  visit "/"
end

Given /^I see see "([^"]*)"$/ do |some_text|
  page.should have_content some_text
end

When /^I click on the "([^"]*)" link$/ do |link|
  click_on link
end


When /^I (press|follow|check|uncheck|choose) "([^\"]*)" for (.*) whose (.*) is "([^\"]*)"$/ do |action, whatyouclick, class_name, var_name, value|
  unless var_name == "id" then
    id = eval("\"#{class_name}\".classify.constantize.find_by_#{var_name}(\"#{value}\").id.to_s")
  else
    id = value
  end
  within("div[id=row_#{class_name}_#{id}]") do
    case action
      when "press"
        click_button(whatyouclick)
      when "follow"
        click_link(whatyouclick)
      when "check"
        check(whatyouclick)
      when "uncheck"
        uncheck(whatyouclick)
      when "choose"
        uncheck(whatyouclick)
    end
  end
end


Then /^here is a string with single and double quotes\- "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^here is a string with the opposite 'the quote is "([^"]*)"'$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^what about a var in a quote like so: "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^what about a multiline string with a var in it like so:$/ do |string|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see something\.\.\.$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^not something else\.\.\.$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^some context \# this is an inline comment \(no longer supported by cucumber\)$/ do
  pending # express the regexp above with the code you wish you had
end
