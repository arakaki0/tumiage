class AddLikedUserIdToLike < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :liked_user_id, :integer
  end
end
