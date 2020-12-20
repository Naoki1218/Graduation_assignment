class Customer < ApplicationRecord
  belongs_to :user
  has_many :customer_estimates, dependent: :destroy
  has_many :estimates, through: :customer_estimates
end
