class AddCustomerNameToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :customer_name, :integer, null: false, default: 0
  end
end
