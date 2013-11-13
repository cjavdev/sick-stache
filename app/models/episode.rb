class Episode < ActiveRecord::Base
  attr_accessible :db_id, :name, :show_id, :watched, :downloaded, :s_num, :e_num
  validates :db_id, uniqueness: true, presence: true
  before_save :update_cached_attrs
  belongs_to :show

  def self.refresh
    Show.includes(:episodes).each do |show|
      show.fetch_episodes
    end
  end

  def self.new_from_obj ep
    e = Episode.new
    e.db_id = ep.id    
    e
  end

  def update_cached_attrs
    self.first_aired ||= air_date ||= (Date.today - 365) 
    self.name ||= ep_name
    self.s_num ||= season_number
    self.e_num ||= episode_number
  end

  def season_number
    @_sn ||= episode.season_number 
  end

  def episode_number
    @_ep_num ||= episode.episode_number 
  end

  def combined_season_number
    @_comb_se_num ||= episode.combined_season
  end

  def combined_episode_number
    @_comb_ep_num ||= episode.combined_episodenumber 
  end

  def filename
    @_filename ||= episode.filename 
  end

  def overview
    @_overview ||= episode.overview 
  end

  def air_date 
    @_first_aired ||= episode.first_aired 
  end

  def ep_name
    @_name ||= episode.episode_name 
  end

  private
  def tvdb
    @_tvdb ||= Tvdbr::Client.new(ENV["TVDBR"]) 
  end

  def episode
    @_episode ||= tvdb.find_episode_by_id(self.db_id) 
  end
end
