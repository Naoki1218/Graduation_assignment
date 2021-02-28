class RemoveQuantityFromEstimates < ActiveRecord::Migration[5.2]
  def change
    remove_column :estimates, :quantity, :integer
  end
end
