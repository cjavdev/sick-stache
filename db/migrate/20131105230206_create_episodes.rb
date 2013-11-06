class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :show_id
      t.integer :db_id
      t.string :name

      t.timestamps
    end
  end
end
