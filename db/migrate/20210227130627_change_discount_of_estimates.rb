class ChangeDiscountOfEstimates < ActiveRecord::Migration[5.2]
  def up
    change_column :estimates, :discount, :integer, default: '0'
  end

  def down
    change_column :estimates, :discount, :integer
  end
end
