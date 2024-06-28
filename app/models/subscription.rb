class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true, numericality: { only_integer: true }
  validates :frequency, presence: true, numericality: { only_integer: true }

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end
