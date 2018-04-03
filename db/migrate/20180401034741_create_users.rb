class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.column "display_name", :string, :limit => 25
      t.column "email", :string, :limit => 75
      # I know some people love their large copy paste passwords
      t.column "password", :string, :limit => 100
      t.timestamps
    end
  end

  def down
    drop_table :users
  end  
end
