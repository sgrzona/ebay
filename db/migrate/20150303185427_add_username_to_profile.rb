class AddUsernameToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :username, :string
  end

  def down
    remove_column :users, :username, :string
  end
end
