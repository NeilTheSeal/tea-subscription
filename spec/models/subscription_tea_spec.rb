require "rails_helper"

RSpec.describe SubscriptionTea, type: :model do
  it "relationships" do
    should belong_to(:tea)
    should belong_to(:subscription)
  end
end
