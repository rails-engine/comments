class CreateCommentsComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :commentable_type
      t.integer :commentable_id
      t.text :body
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth, default: 0, null: false

      t.timestamps null: false
    end

    add_index :comments, [:commentable_type, :commentable_id]
    add_index :comments, :parent_id
    add_index :comments, :lft
    add_index :comments, :rgt
  end
end
