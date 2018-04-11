class AddImagesToGroupsAndPosts < ActiveRecord::Migration[5.1]
  def change
    add_attachment :posts, :avatar
    add_attachment :groups, :avatar
  end
end
