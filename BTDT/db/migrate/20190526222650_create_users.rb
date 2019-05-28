class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :country_of_origin
      t.string :profile_pic
      t.integer :points
      t.string :password_digest

      t.timestamps
    end
  end
end
