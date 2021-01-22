class Product < ApplicationRecord
# belongs_to :estimate
has_many :estimate_products, dependent: :destroy
accepts_nested_attributes_for :estimate_products, allow_destroy: true
has_many :estimates, through: :estimate_products
# SELECT `products`.* FROM `products` WHERE (`products`.`name` LIKE '%#name%')
end
