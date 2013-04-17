FactoryGirl.define do
  factory :candidacy do 
  end
  factory :candidacy_with_propositions, parent: :candidacy do
    after(:create) do
      propositions FactoryGirl.create_list :proposition, 10
    end
  end
  factory :candidacy_with_candidate, parent: :candidacy do
    after(:create) do
      candidates [ FactoryGirl.create(:candidate) ]
    end
  end
  factory :candidacy_with_organization, parent: :candidacy do
    after(:create) do
      organization FactoryGirl.create :organization
    end
  end
end
