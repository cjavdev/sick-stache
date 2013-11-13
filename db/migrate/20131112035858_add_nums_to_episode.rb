class AddNumsToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :s_num, :string
    add_column :episodes, :e_num, :string
  end
end
