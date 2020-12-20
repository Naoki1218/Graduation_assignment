class RemoveStockFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :deadline, :date
  end
end
