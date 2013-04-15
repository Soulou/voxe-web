Given /^There is a country with the name "([^"]*)"$/ do |country_name|
  FactoryGirl.create :country, name: country_name
end
