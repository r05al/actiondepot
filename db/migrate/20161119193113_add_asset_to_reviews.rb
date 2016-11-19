class AddAssetToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :asset, :string
  end
end
