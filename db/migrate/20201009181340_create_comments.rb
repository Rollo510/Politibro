class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :meme_id
      t.datetime :posted_at
      t.text :comment

      t.timestamps
    end
  end
end
