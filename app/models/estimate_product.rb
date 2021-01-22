class EstimateProduct < ApplicationRecord
  belongs_to :estimate
  belongs_to :product

def change
  create_table :estimate_products do |t|
　  t.references :estimate, foreign_key: true, null: false
　  t.references :product, foreign_key: true, null: false
　  t.integer :quantity, null: false
　  t.timestamps
    end
  end
end
