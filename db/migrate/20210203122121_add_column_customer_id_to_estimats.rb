class AddColumnCustomerIdToEstimats < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :customer_id, :bigint
  end
end
