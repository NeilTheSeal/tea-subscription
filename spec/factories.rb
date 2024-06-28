require "faker"

FactoryBot.define do
  factory :subscription_customer do
    subscription { nil }
    customer { nil }
  end

  factory :customer do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    address { "MyString" }
  end

  factory :subscription_tea do
    tea { nil }
    subscription { nil }
  end

  factory :subscription do
    title { "MyString" }
    price { 1 }
    status { 1 }
    frequency { 1 }
  end

  factory :tea do
    title { "MyString" }
    description { "MyString" }
    temperature { 1 }
    brew_time { 1 }
  end
end
