class EstimateProduct < ApplicationRecord
  belongs_to :estimate
  belongs_to :product

  # def total
  # 		product.unit_price * quantity
  # end

end
