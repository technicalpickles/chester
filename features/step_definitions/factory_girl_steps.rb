Factory.factories.each do |name, factory|
  Given /^an? #{name.to_s.downcase.gsub('_', ' ')} exists$/ do
    Factory(name)
  end
  
  Given /^(\d+) #{name.to_s.downcase.pluralize.gsub('_', ' ')} exist$/ do |n|
    n.to_i.times { Factory(name) }
  end
  
  Given /^an? #{name.to_s.downcase.gsub('_', ' ')} exists with an? (.*) of "([^"]*)"$/ do |attr, value|
    Factory(name, attr.gsub(' ', '_') => value)
  end
end
