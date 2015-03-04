class AddUsernameToUsers < ActiveRecord::Migration
  
  def down
    remove_column :users, :username, :string
  end
end
