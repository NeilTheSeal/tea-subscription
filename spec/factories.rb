require "faker"

FactoryBot.define do
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
