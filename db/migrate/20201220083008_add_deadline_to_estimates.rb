class AddDeadlineToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :deadline, :date
  end
end
