class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :genre
    end
  end
end
