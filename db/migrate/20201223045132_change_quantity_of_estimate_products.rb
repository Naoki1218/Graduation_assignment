class ChangeQuantityOfEstimateProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :estimate_products, :quantity, :integer, default: '1'
  end

  def down
    change_column :estimate_products, :quantity, :integer
  end
end
