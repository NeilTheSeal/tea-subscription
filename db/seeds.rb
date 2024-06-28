# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

# Create 10 customers
customers = []
10.times do
  customers << Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address
  )
end

# Create 10 teas
teas = []
10.times do
  teas << Tea.create(
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    temperature: 1,
    brew_time: 1
  )
end

# Create 10 subscriptions
subscriptions = []
10.times do
  subscriptions << Subscription.create(
    title: Faker::Lorem.word,
    price: 1,
    status: 1,
    frequency: 1
  )
end

# Create 10 subscription_teas
subscription_teas = []
(0..9).each do |i|
  subscription_teas << SubscriptionTea.create(
    tea: teas[i],
    subscription: subscriptions[i]
  )
end

# Create 10 subscription_customers
subscription_customers = []
(0..9).each do |i|
  subscription_ids = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(2)
  subscription_customers << SubscriptionCustomer.create(
    customer: customers[i],
    subscription_id: subscription_ids[0]
  )
  subscription_customers << SubscriptionCustomer.create(
    customer: customers[i],
    subscription_id: subscription_ids[1]
  )
end
