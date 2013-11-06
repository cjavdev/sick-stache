require 'spec_helper'

describe Episode do
  subject(:ep) { Episode.create(db_id: 1285811) }
  
  it "has an episode number" do
    ep.episode_number.should == "1" 
  end

  it "has a filename" do
    ep.filename.should == "http://www.thetvdb.com/banners/episodes/79349/1285811.jpg"
  end

  it "has a name" do
    ep.name.should == "Early Cuts: Alex Timmons (Chapter 1)"
  end
 
  it "has an episode number" do
    ep.episode_number.should == "1"
  end

  it "has an overview" do
    ep.overview.should == "Dexter hunts Alex Timmons, a corrupt Gulf War veteran who used the cover of war to kill the innocent."
  end

  it "has a season number" do
    ep.season_number.should == "0"
  end
end
