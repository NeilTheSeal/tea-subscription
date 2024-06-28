require "rails_helper"

RSpec.describe Customer, type: :model do
  it "validations" do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:email)
    should validate_presence_of(:address)
  end

  it "relationships" do
    should have_many(:subscription_customers)
    should have_many(:subscriptions).through(:subscription_customers)
  end
end
