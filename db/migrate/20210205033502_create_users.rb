class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.integer :profile_id
      t.string :password_digest
      t.string :avatar
      t.timestamps
    end
  end
end
