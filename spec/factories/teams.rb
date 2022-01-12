FactoryBot.define do
  factory :team do
    name { "Team" }
    abbreviation { "T" }

    trait :OAK do
      name { "Oakland Raiders" }
      abbreviation { "OAK" }
    end

    trait :TB do
      name { "Tampa Bay Buccaneers" }
      abbreviation { "TB" }
    end

    trait :NYJ do
      name { "New York Jets" }
      abbreviation { "NYJ" }
    end

    trait :NE do
      name { "New England Patriots" }
      abbreviation { "NE" }
    end
  end
end