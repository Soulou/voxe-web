Then /^I should see all the coutries$/ do
  @country_names = Set.new Country.all.map { |c| c.name }
  @html_country_names = Set.new page.all("div.country").map { |c| c.text }
  @country_names.subset?(@html_country_names).should == true
end

Then /^I should see the elections of "(.*?)"$/ do |country|
  @election_names = Set.new Country.where(name: country).first.elections.map { |e| e.name }
  @html_election_names = Set.new page.all("div.election").map { |e| e.text }
  @election_names.subset?(@html_election_names).should == true
end

Then /^I should see the candidates of "(.*?)"$/ do |candidate|
  @candidate_names = Set.new Election.where(name: candidate).first.candidacies.map { |c| c.name }
  @html_candidate_names = Set.new page.all("div.candidacy").map { |c| c.text }
  @candidate_names.subset?(@html_candidate_names).should == true
end


When /^I click on the country "(.*?)"/ do |country|
  page.all("div.country").each do |country_div|
    if country_div.text == country
      country_div.click
    end
  end
end

When /^I click on the election "(.*?)"$/ do |election|
  page.all("div.election").each do |election_div|
    if election_div.text == election
      election_div.click
      sleep 2
      require 'pry'
      binding.pry
    end
  end
end
