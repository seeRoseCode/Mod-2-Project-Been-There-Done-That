class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :language
      t.string :flag_emoji
      t.timestamps
    end
  end
end
