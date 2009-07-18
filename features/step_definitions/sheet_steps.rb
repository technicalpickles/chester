Given /^a sheet titled "([^\"]*)" exists$/ do |title|
  Factory(:sheet, :title => title)
end

Given /^there are more than enough sheets to fill the "([^\"]*)" sidebar$/ do |arg1|
  20.times { Factory(:sheet) }
end

Given /^the sheet titled "([^\"]*)" was recently edited$/ do |title|
  Factory(:recent_sheet, :title => title)
end

Given /^the sheet titled "([^\"]*)" was not recently edited$/ do |title|
  Factory(:old_sheet, :title => title)
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
