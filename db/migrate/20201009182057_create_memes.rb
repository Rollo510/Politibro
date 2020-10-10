class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :title
      t.boolean :nsfw
      t.string :description
      t.datetime :posted_at

      t.timestamps
    end
  end
end
