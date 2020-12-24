class AddUserIdToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :user_id, :bigint
  end
end
