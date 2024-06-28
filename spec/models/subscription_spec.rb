require "rails_helper"

RSpec.describe Subscription, type: :model do
  it "validations" do
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_numericality_of(:price).only_integer
    should validate_presence_of(:status)
    should validate_numericality_of(:status).only_integer
    should validate_presence_of(:frequency)
    should validate_numericality_of(:frequency).only_integer
  end

  it "relationships" do
    should have_many(:subscription_teas)
    should have_many(:teas).through(:subscription_teas)
    should have_many(:subscription_customers)
    should have_many(:customers).through(:subscription_customers)
  end
end
