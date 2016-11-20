class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
    	t.string :asset
    	t.references :review

      t.timestamps
    end
  end

  remove_column :reviews, :asset
end
