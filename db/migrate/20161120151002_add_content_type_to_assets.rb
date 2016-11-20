class AddContentTypeToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :content_type, :string
  end
end
