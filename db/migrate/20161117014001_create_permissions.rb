class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.integer :thing_id
      t.string :thing_type
      t.string :action

      t.timestamps
    end
  end
end
