class CreatePostBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :post_books do |t|
      t.integer :user_id
      t.text :title
      t.text :opinion
      t.text :create_at
      t.text :update_at

      t.timestamps
    end
  end
end
