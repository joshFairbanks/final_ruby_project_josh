class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string "author"
      t.text "description"
      t.integer "upvotes"
      t.timestamps
    end
  end
end
