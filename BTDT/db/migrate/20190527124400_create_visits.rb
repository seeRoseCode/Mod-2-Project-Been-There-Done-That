class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.belongs_to :country
      t.belongs_to :user
      t.timestamps
    end
  end
end
