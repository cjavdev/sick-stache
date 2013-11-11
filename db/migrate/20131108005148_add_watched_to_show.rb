class AddWatchedToShow < ActiveRecord::Migration
  def change
    add_column :shows, :watched, :boolean
  end
end
