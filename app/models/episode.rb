class Episode < ActiveRecord::Base
  attr_accessible :db_id, :name, :show_id

  belongs_to :show
end
