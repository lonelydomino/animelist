class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :desc
      t.references :owner, foreign_key: {to_table: :users, on_delete: :cascade}
      t.timestamps null: false
    end
  end
end
