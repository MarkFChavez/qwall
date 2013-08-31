class CreateUserFavorites < ActiveRecord::Migration
  def change
    create_table :user_favorites do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_index :user_favorites, :user_id
    add_index :user_favorites, :post_id
  end
end
