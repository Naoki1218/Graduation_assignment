class Product < ApplicationRecord
belongs_to :estimate
has_many :estimate_products, dependent: :destroy
has_many :estimates, through: :estimate_products
# SELECT `products`.* FROM `products` WHERE (`products`.`name` LIKE '%#name%')
end
