class RenameEmoji < ActiveRecord::Migration[5.2]
  def change
    rename_column :countries, :emoji, :flag_emoji
  end
end
