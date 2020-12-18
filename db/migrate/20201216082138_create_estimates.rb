class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.integer        :total_price
      t.integer        :discount
      
      t.timestamps
    end
  end
end
