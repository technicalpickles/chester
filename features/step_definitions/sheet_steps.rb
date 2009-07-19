Given /^there are more than enough sheets to fill the "([^\"]*)" sidebar$/ do |arg1|
  Given "20 sheets exist"
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
