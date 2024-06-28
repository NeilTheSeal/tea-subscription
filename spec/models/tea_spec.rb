require "rails_helper"

RSpec.describe Tea, type: :model do
  it "validations" do
    should validate_presence_of(:title)
    should validate_presence_of(:description)
    should validate_presence_of(:temperature)
    should validate_presence_of(:brew_time)
    should validate_numericality_of(:temperature).only_integer
    should validate_numericality_of(:brew_time).only_integer
  end

  it "relationships" do
    should have_many(:subscription_teas)
    should have_many(:subscriptions).through(:subscription_teas)
  end
end
