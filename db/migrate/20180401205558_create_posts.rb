class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string "title"
      t.string "image_path"
      t.integer "upvotes"
      t.timestamps
    end
  end
end
