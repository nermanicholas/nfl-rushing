FactoryBot.define do
  factory :player do
    name { "Player" }
    team
    position

    trait :auston_matthews do
      name { "Auston Matthews" }
      team factory: :OAK
      position factory: :QB
    end

    trait :john_doe do
      name { "John Doe" }
      team factory: :TB
      position factory: :WR
    end

    trait :john_snow do
      name { "John Snow" }
      team factory: :NYJ
      position factory: :RB
    end

    trait :eren_yeager do
      name { "Eren Yeager" }
      team factory: :NE
      position factory: :FS
    end
  end
end