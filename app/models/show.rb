class Show < ActiveRecord::Base
  attr_accessible :db_id, :last_updated
  validates :db_id, uniqueness: true, presence: true
  has_many :episodes

  def self.names_like str
    tvdb.find_all_series_by_title(str).map do |s|
      s.series_name
    end
  end

  def self.new_with_name str
    s = Show.new
    s.db_id = tvdb.find_all_series_by_title(str).first.id    
    s
  end

  def fetch_episodes
    if series.episodes.count > self.episodes.count
      series.episodes.each do |ep|
        self.episodes << Episode.new_from_obj(ep)
      end
    end
  end

  def actors
    @_actors ||= series.actors
  end

  def imdb_id
    @_imdb_id ||= series.imdb_id
  end

  def airs_day_of_week
    @_dow ||= series.airs_day_of_week
  end

  def airs_time
    @_time ||= series.airs_time
  end

  def fanart
    @_fanart ||= series.fanart
  end

  def zap2it_id
    @_zap2it_id ||= series.zap2it_id
  end

  def poster
    @_poster ||= series.poster
  end

  def name
    @_name ||= series.series_name
  end

  private
  def self.tvdb
    Tvdbr::Client.new(ENV["TVDBR"])
  end

  def tvdb
    Tvdbr::Client.new(ENV["TVDBR"])
  end

  def series
    @_series ||= tvdb.find_series_by_id(self.db_id)
  end
end
