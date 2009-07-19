Given /^there are more than enough sheets to fill the "([^\"]*)" sidebar$/ do |_|
  Given "20 sheets exist"
end

Given /^no sheet exists with a title of "(.+)"$/ do |title|
  s = Sheet.find_by_title(title)
  s.destroy if s.present?
end

Given /^the sheet titled "([^\"]*)" has a body of "([^\"]*)"$/ do |title, body|
  Sheet.find_or_create_by_title(title).update_attributes!(:body => body)
end

Then /^I should see "([^\"]*)" in the "([^\"]*)" sidebar$/ do |text, sidebar_name|
  within "##{sidebar_name.downcase.gsub(' ', '_')}" do |scope|
    scope.should contain(text)
  end
end

Then /^I should not see "([^\"]*)" in the "([^\"]*)" sidebar$/ do |text, sidebar_name|
  within "##{sidebar_name.downcase.gsub(' ', '_')}" do |scope|
    scope.should_not contain(text)
  end
end
