FactoryBot.define do
    factory :user do
        username {Faker::Games::SuperSmashBros.character}
        password {"smashbros"}
    end
end