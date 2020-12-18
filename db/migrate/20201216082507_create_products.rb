class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string         :name
      t.date           :deadline
      t.integer        :stock
      t.integer        :prime_cost
      t.integer        :unit_price
      
      t.timestamps
    end
  end
end
