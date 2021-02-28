class Estimate < ApplicationRecord
  # validates :product_ids, presence: true
  validates :deadline, presence: true
  validates :discount, length: { maximum: 6 }

  belongs_to :user
  has_many :reasons, dependent: :destroy
  belongs_to :customer
  has_many :estimate_products, dependent: :destroy
  has_many :products, through: :estimate_products
  accepts_nested_attributes_for :estimate_products, allow_destroy: true

  validate :deadline_cannot_be_in_the_past
  validate :discount_check


  def deadline_cannot_be_in_the_past
    errors.add(:納期, "は今日以降を選択してください") if deadline.present? && deadline.past?
  end

  def discount_check
    errors.add(:値引額, "確認してください！！") unless discount < EstimateProduct.sum_prices(estimate_products)
  end
end
