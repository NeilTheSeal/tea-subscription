require "rails_helper"

RSpec.describe SubscriptionCustomer, type: :model do
  it "relationships" do
    should belong_to(:subscription)
    should belong_to(:customer)
  end
end
