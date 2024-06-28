require "rails_helper"

RSpec.describe "subscribe to a subscription", type: :request do
  let(:subscription) { create(:subscription) }
  let(:customer) { create(:customer) }

  it "subscribes a customer to a subscription" do
    post(
      "/api/v1/subscription",
      params: {
        email: customer.email,
        subscription_id: subscription.id
      }
    )
    expect(response).to have_http_status(:created)

    expect(SubscriptionCustomer.count).to eq(1)
  end
end
