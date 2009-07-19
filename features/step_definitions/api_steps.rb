When /^I ask for all sheets in (.+)$/ do |format|
  get '/ya/'
end

When /^I ask for recent sheets in (.+)$/ do |format|
  get '/yr/'
end

Then /^I should get a YAML list$/ do
  response.headers['Content-Type'].should match(/ya?ml/i)
end

Then /^the list of sheets should include "(.+)"$/ do |title|
  response.body.should include(title)
end

Then /^the list of sheets should not include "(.+)"$/ do |title|
  response.body.should_not include(title)
end