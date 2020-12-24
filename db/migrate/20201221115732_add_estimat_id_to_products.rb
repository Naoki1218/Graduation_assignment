class AddEstimatIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :estimate_id, :bigint
  end
end
