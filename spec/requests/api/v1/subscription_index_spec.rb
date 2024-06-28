require "rails_helper"

RSpec.describe "list all subscriptions", type: :request do
  before(:each) do
    @customer = create(:customer)
    @subscription_list = create_list(:subscription, 3)
    @subscription_customer_list = []
    (0..2).each do |i|
      @subscription_customer_list << create(
        :subscription_customer,
        customer: @customer,
        subscription: @subscription_list[i]
      )
    end
  end

  it "lists all subscriptions" do
    get(
      "/api/v1/customer",
      params: {
        customer_id: @customer.id
      }
    )
    expect(response).to have_http_status(:ok)

    expect(response.body).to include(@subscription_customer_list[0].id.to_s)
    expect(response.body).to include(@subscription_customer_list[1].id.to_s)
    expect(response.body).to include(@subscription_customer_list[2].id.to_s)
  end
end
