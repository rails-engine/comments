class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :user_id
      t.integer :comments_count, default: 0, null: false

      t.timestamps
    end
  end
end
