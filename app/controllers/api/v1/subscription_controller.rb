class Api::V1::SubscriptionController < ApplicationController
  def create
    customer = Customer.find_or_create_by(email: subscription_params[:email])
    subscription_customer = SubscriptionCustomer.new(
      customer_id: customer.id,
      subscription_id: subscription_params[:subscription_id]
    )
    if subscription_customer.save
      render json: subscription_customer, status: :created
    else
      render json: subscription_customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    subscription = SubscriptionCustomer.find_by(
      customer_id: customer.id,
      subscription_id: subscription_params[:subscription_id]
    )
    if subscription.destroy
      render json: subscription, status: :ok
    else
      render json: subscription.errors, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.permit(:id, :subscription_id)
  end
end
