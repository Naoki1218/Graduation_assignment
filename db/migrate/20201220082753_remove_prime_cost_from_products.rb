class RemovePrimeCostFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :prime_cost, :integer
  end
end
