namespace :stache do
  desc "imports tv shows"
  task :import => :environment do
    tvdb = Tvdbr::Client.new(ENV["TVDBR"])
    dexter = tvdb.fetch_series_from_data(:title => "Dexter")
    Show.create!(:db_id => dexter.id, :name=>dexter.series_name)
  end
end
