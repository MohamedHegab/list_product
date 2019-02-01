FactoryBot.define do
  factory :product do
    title { Faker::Company.name }
    description { Faker::Company.name }
    price { Faker::Company.name }
    category
  end
end
