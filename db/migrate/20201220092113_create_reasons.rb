class CreateReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :reasons do |t|
      t.references :estimate, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean    :approval
      t.text    :content

      t.timestamps
    end
  end
end
