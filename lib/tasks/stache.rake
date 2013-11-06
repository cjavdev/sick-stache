namespace :stache do
  desc "imports tv shows"
  task :import => :environment do
    tvdb = Tvdbr::Client.new("277A0FDBB2D8636F")
    dexter = tvdb.fetch_series_from_data(:title => "Dexter")
    Show.create!(:db_id => dexter.id, :name=>dexter.series_name)
  end
end
