FactoryBot.define do
  factory :position do
    name { "Position" }
    abbreviation { "Pos" }

    trait :QB do
      name { "Quarterback" }
      abbreviation { "QB" }
    end

    trait :WR do
      name { "Wide Receiver" }
      abbreviation { "WR" }
    end

    trait :RB do
      name { "Running Back" }
      abbreviation { "RB" }
    end

    trait :FS do
      name { "Free Safety" }
      abbreviation { "FS" }
    end
  end
end