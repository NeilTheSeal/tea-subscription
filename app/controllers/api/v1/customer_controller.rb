class Api::V1::CustomerController < ApplicationController
  def create
    customer = Customer.create_or_find_by(id: customer_params[:customer_id])
    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  def index
    customer = Customer.find_by(id: params[:customer_id])
    subscriptions = customer.subscription_customers
    render json: subscriptions, status: :ok
  end

  private

  def customer_params
    params.permit(:customer_id)
  end
end
