Given /^a sheet titled "([^\"]*)" exists$/ do |title|
  Factory(:sheet, :title => title)
end

