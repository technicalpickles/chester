When /^I ask for all sheets in (.+)$/ do |format|
  get '/ya/'
end

Then /^I should get a (.+) list of all cheat sheets$/ do |format|
  response.headers['Content-Type'].should match(/#{format}/i)
end

Then /^the list of sheets should include "(.+)"$/ do |title|
  response.body.should include(title)
end

Then /^the list of sheets should not include "(.+)"$/ do |title|
  response.body.should_not include(title)
end