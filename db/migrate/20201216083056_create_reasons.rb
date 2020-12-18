class CreateReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :reasons do |t|
      t.text           :content
      t.bigint         :user_id
      t.bigint         :estimate_id
      t.boolean        :approval

      t.timestamps
    end
  end
end
