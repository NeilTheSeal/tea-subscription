class AddStatusToSubscriptionCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :subscription_customers, :status, :integer
  end
end
