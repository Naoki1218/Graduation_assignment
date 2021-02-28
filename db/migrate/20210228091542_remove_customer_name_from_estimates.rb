class RemoveCustomerNameFromEstimates < ActiveRecord::Migration[5.2]
  def change
    remove_column :estimates, :customer_name, :integer
  end
end
