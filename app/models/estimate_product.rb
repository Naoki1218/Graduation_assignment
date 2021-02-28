class EstimateProduct < ApplicationRecord
  belongs_to :estimate
  belongs_to :product

  def sum_price
    self.product.unit_price * self.quantity
  end

  def self.sum_prices(estimate_products = [])
    estimate_products
      .map(&:sum_price)
      .inject(:+)
  end
end
