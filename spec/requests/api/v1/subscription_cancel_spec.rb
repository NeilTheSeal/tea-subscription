require "rails_helper"

RSpec.describe "cancel a subscription", type: :request do
  before(:each) do
    @subscription = create(:subscription)
    @customer = create(:customer)
    create(
      :subscription_customer,
      customer: @customer,
      subscription: @subscription
    )
  end

  it "cancels a subscription" do
    expect(SubscriptionCustomer.first.status).to eq(1)

    delete(
      "/api/v1/subscription/#{@customer.id}",
      params: {
        subscription_id: @subscription.id
      }
    )
    expect(response).to have_http_status(:ok)

    expect(SubscriptionCustomer.first.status).to eq(0)
  end
end
