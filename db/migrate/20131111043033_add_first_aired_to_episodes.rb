class AddFirstAiredToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :first_aired, :date
  end
end
