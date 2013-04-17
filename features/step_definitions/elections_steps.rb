Given /^I am on the elections page$/ do
  visit '/admin#elections'
  page.should have_content 'Elections'
  page.should have_content 'Ajouter une Election'
end

Given /^There is a published election$/ do
  @election = FactoryGirl.create :election, published: true
end

Given /^There is an unpublished election$/ do
  @election = FactoryGirl.create :election, published: false
end

Then /^The election should be unpublished$/ do
  @election.reload
  @election.published.should be false
end

Then /^The election should be published$/ do
  @election.reload
  @election.published.should be true
end

Then /^An election with the name "([^"]*)" should be registred$/ do |name|
  Election.where(name: name).count.should >= 1
end

Given /^There is an election with the name "([^"]*)"$/ do |election_name|
  @election = FactoryGirl.create :election, name: election_name
end

Given /^There is an election in "(.*?)" with the name "(.*?)"$/ do |country, election_name|
  @country = Country.where(name: country).first
  @election = FactoryGirl.create :election, country: @country, name: election_name
end
