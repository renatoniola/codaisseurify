FactoryBot.define do
  factory :song do
    title { Faker::Name.first_name }


  end
end
