class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :bio
      t.integer :age
      t.integer :user_id
      t.string :favorite_series
      t.timestamps null: false
    end
  end
end
