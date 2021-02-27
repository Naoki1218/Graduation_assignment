class Estimate < ApplicationRecord
  # validates :product_ids, presence: true
  validates :deadline, presence: true
  # validates :total_price, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :user
  has_many :reasons, dependent: :destroy
  belongs_to :customer
  # has_many :users
  # has_many :products
  # has_many :customer_estimates, dependent: :destroy
  # has_many :customers, through: :customer_estimates
  has_many :estimate_products, dependent: :destroy
  has_many :products, through: :estimate_products
  # has_many :products, inverse_of: :estimate
  accepts_nested_attributes_for :estimate_products, allow_destroy: true

  validate :deadline_cannot_be_in_the_past

  # def date_before_start
  #   errors.add(:納期, "は今日以降を選択してください") if
  #   deadline < Date.current
  # end

  def deadline_cannot_be_in_the_past
  if deadline.present? && deadline.past?
    errors.add(:納期, "は今日以降を選択してください")
  end
end



end
