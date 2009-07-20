When /^I ask for all sheets in YAML$/ do
  get '/ya/'
end

When /^I ask for recent sheets in YAML$/ do
  get '/yr/'
end

When /^I ask for the sheet titled "([^\"]*)" in YAML$/ do |title|
  get "/y/#{title}"
end

When /^I use the gem to create a new cheat with a title of "([^\"]*)"$/ do |title|
  post "/w/", { 'sheet_title' => title, 'sheet_body' => '', 'from_gem' => true }
end


Then /^I should get a YAML list$/ do
  response.headers['Content-Type'].should match(/ya?ml/i)
end

Then /^the list of sheets titled "(.+)" should include "(.+)"$/ do |list, sheet|
  YAML.load(response.body)[list].should include(sheet)
end

Then /^the list of sheets titled "(.+)" should not include "(.+)"$/ do |list, sheet|
  YAML.load(response.body)[list].should_not include(sheet)
end

Then /^I should get a YAML object titled "([^\"]*)"$/ do |title|
  YAML.load(response.body)[title].should_not == nil
end

Then /^the YAML object titled "([^\"]*)" should contain "([^\"]*)"$/ do |title, body_part|
  YAML.load(response.body)[title].should match(/#{body_part}/)
end

Then /^I should receive a 201 Created for the "([^\"]*)" sheet$/ do |title|
  sheet = Sheet.find_by_title(title)
  response.code.to_i.should == 201
  response.headers['Location'].should match(/\/sheets\/#{sheet.to_param}/)
end
