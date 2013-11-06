require 'spec_helper'

describe Show do
  subject(:dexter) { Show.create!(:db_id=>'79349') }
  it "has actors" do
    dexter.actors.should be_instance_of Array 
  end

  it "has a name" do
    dexter.name.should == "Dexter"
  end

  it "has airs_day_of_week" do
    dexter.airs_day_of_week.should == "Sunday"
  end

  it "has airs_time" do
    dexter.airs_time.should == "9:00 PM"
  end

  it "has fanart" do
    dexter.fanart.should == "http://www.thetvdb.com/banners/fanart/original/79349-59.jpg"
  end
  
  it "has imdb_id" do
    dexter.imdb_id.should == "tt0773262"
  end
  
  it "has a poster" do
    dexter.poster.should == "http://www.thetvdb.com/banners/posters/79349-2.jpg"
  end

  it "has a zap2it_id" do
    dexter.zap2it_id.should == "EP00859795"
  end

  it "must be unique show" do
    show1 = Show.create(:db_id => 1)
    show2 = Show.new(:db_id => 1)
    show2.should_not be_valid
  end
end
