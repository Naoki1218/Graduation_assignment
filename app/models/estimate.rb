class Estimate < ApplicationRecord
  belongs_to :user
  # has_many :products
  has_many :customer_estimates, dependent: :destroy
  has_many :customers, through: :customer_estimates
  has_many :estimate_products, dependent: :destroy
  has_many :products, through: :estimate_products
  # accepts_nested_attributes_for :products

  # def total
  # 	estimate_products.to_a.sum { |pro| pro.total }
  # end

  enum customer_name: {
    株式会社AAA:1,株式会社BBB:2,株式会社CCC:3,株式会社DDD:4,株式会社EEE:5,株式会社FFF:6,株式会社GGG:7,
    株式会社HHH:8,株式会社III:9,株式会社JJJ:10,株式会社KKK:11,株式会社LLL:12
  }



end
