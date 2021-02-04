class Customer < ApplicationRecord
  validates :name, presence: true
  # 登録時バリデーションで引っかかるので、一時コメントアウト
  # belongs_to :user
  has_many :estimates
  # has_many :customer_estimates, dependent: :destroy
  # has_many :estimates, through: :customer_estimates
end
