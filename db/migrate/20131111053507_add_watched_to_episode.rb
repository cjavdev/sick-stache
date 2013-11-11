class AddWatchedToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :watched, :boolean
    add_column :episodes, :downloaded, :boolean
  end
end
