class Product < ApplicationRecord
  validates :name, presence: true
  validates :stock, presence: true
  validates :unit_price, presence: true
  has_many :estimate_products, dependent: :destroy
  accepts_nested_attributes_for :estimate_products, allow_destroy: true
  has_many :estimates, through: :estimate_products
end
