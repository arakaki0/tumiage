class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :user_id
      t.string :integer
      t.string :post_id
      t.string :integer

      t.timestamps
    end
  end
end
