class CreateUserIds < ActiveRecord::Migration
  def change
    create_table :user_ids do |t|
      t.integer :string

      t.timestamps
    end
  end
end
