class CreateAnimeLists < ActiveRecord::Migration[6.1]
  def change
    create_table :animelists do |t|
      t.references :anime
      t.references :list
      t.timestamps null: false
    end
  end
end
