class CreateEstimateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :estimate_products do |t|
      t.references :estimate, foreign_key: true
      t.references :product, foreign_key: true
      t.integer    :quantity

      t.timestamps
    end
  end
end
