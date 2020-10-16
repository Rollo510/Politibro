class AddUserIdToMemes < ActiveRecord::Migration[6.0]
  def change
    add_column :memes, :user_id, :integer
  end
end
