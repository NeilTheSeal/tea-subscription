require "faker"

FactoryBot.define do
  factory :subscription_customer do
    subscription { nil }
    customer { nil }
    status { 1 }
  end

  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end

  factory :subscription_tea do
    tea { nil }
    subscription { nil }
  end

  factory :subscription do
    title { Faker::Lorem.word }
    price { 1 }
    status { 1 }
    frequency { 1 }
  end

  factory :tea do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    temperature { 1 }
    brew_time { 1 }
  end
end
