class CreateCustomerEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_estimates do |t|
      t.references :estimate, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
