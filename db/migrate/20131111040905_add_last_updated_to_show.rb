class AddLastUpdatedToShow < ActiveRecord::Migration
  def change
    add_column :shows, :last_updated, :datetime
  end
end
