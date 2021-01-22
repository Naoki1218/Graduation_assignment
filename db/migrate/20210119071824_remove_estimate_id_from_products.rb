class RemoveEstimateIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :estimate_id, :bigint
  end
end
