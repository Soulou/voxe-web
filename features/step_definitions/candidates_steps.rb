
Given /^There are the candidates defined by this table$/ do |table|
  table.hashes.each do |candidate_hash|
    FactoryGirl.create :candidate, 
      first_name: candidate_hash[:first_name], 
      last_name:  candidate_hash[:last_name]
  end
  @candidates = Candidate.all
end

Given /^They run for the election "(.*?)"$/ do |election|
  @election = Election.where(name: election).first
  @candidates.each do |candidate|
    FactoryGirl.create :candidacy, election: @election, candidates: [candidate]
  end
end
