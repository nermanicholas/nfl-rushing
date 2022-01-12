FactoryBot.define do
  factory :rushing do
    trait :bad_rushing_stats do
      attempts { 0.1 }
      attempts_per_game { 1.2 }
      yards { -23 }
      yards_per_attempt { -11.5 }
      yards_per_game { -1.4 }
      touchdowns { 0 }
      longest { 0 }
      first_downs { 0 }
      first_down_percentage { 0 }
      twenty_plus_yards { 0 }
      forty_plus_yards { 0 }
      fumbles { 0 }
      player factory: :john_doe
    end

    trait :average_rushing_stats do
      attempts { 9.1 }
      attempts_per_game { 65 }
      yards { 199 }
      yards_per_attempt { 4.7 }
      yards_per_game { 43.9 }
      touchdowns { 2 }
      longest { 15 }
      first_downs { 14 }
      first_down_percentage { 23.5 }
      twenty_plus_yards { 0 }
      forty_plus_yards { 0 }
      fumbles { 1 }
      player factory: :john_snow
    end

    trait :good_rushing_stats do
      attempts { 22.3 }
      attempts_per_game { 293 }
      yards { 1002 }
      yards_per_attempt { 6.1 }
      yards_per_game { 81.2 }
      touchdowns { 15 }
      longest { 48 }
      first_downs { 68 }
      first_down_percentage { 34.2 }
      twenty_plus_yards { 9 }
      forty_plus_yards { 4 }
      fumbles { 0 }
      player factory: :auston_matthews
    end
  end
end