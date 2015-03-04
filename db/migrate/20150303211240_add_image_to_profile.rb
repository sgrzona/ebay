class AddImageToProfile < ActiveRecord::Migration

  def up
    add_column :profiles, :image, :attachment
  end


  def down
    remove_column :profiles, :image_file_name,    :string
    remove_column :profiles, :image_content_type, :string
    remove_column :profiles, :image_file_size,    :integer
    remove_column :profiles, :image_updated_at,   :datetime
    remove_column :profiles, :image,              :attachment

  end
end
