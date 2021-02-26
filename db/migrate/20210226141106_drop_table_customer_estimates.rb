class DropTableCustomerEstimates < ActiveRecord::Migration[5.2]
  def change
     drop_table :customer_estimates
  end
end
