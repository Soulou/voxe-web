When /^I click on "([^"]*)" button$/ do |button|
  click_button button
end

When /^I click on the link "(.*?)"$/ do |link|
  click_link link
end

When /^I click on "(.*?)"$/ do |content|
  require 'pry'
  binding.pry
end


Then /^The "(.*?)" link should target "(.*?)"$/ do |link, href|
  find_link(link)["href"].should =~ /^#{href}/
end

Then /^I should see "([^"]*)" on the page$/ do |content|
  page.should have_content content
end

When /^I fill the "([^"]*)" text field with "([^"]*)"$/ do |text_field, content|
  fill_in text_field, with: content
end

Given /^I am on the homepage$/ do
  visit '/'
  current_path.should == "/"
end

Then /^I should see "(.*?)" as title of the page$/ do |title|
  ## Waiting capybara ~> 2.1.0
  # page.has_title? title
  Capybara.string(page.body).has_selector?('title', text: title)
end
