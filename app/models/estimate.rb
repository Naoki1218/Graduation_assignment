class Estimate < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :customer_estimates, dependent: :destroy
  has_many :customers, through: :customer_estimates
  has_many :estimate_products, dependent: :destroy
  has_many :productss, through: :estimate_products
end
