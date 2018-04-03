class Create < ActiveRecord::Migration[5.1]
  def up
    create_table :groups_users, :id => false do |t|
      t.integer "user_id"
      t.integer "group_id"
    end  
    add_index("groups_users", ["user_id", "group_id"])
  end

  def down
    drop_table :groups_users
  end  
end
