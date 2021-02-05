class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :genre
      t.string :avatar
      t.timestamps
    end
  end
end
