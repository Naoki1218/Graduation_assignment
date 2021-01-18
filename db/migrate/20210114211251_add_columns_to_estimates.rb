class AddColumnsToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :product_name, :string
    add_column :estimates, :quantity, :integer
  end
end
