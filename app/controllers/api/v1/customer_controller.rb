class Api::V1::CustomerController < ApplicationController
  def create
    customer = Customer.create_or_find_by(email: customer_params[:email])
    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  def index
    subscriptions = Customer.subscription_customers
    render json: subscriptions, status: :ok
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end
end
