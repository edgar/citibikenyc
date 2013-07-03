require File.expand_path('../../../spec_helper', __FILE__)

describe Citibikenyc::Client do
  before do
    @client = Citibikenyc::Client.new
  end

  describe ".stations" do
    before do
      stub_get('data2/stations.php').
        to_return(:body => fixture("stations.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the correct resource" do
      @client.stations
      a_get('data2/stations.php').should have_been_made
    end

    it "should return the stations info" do
      data = @client.stations
      data.keys.should be == ["ok", "meta", "results", "activeStations", "totalStations", "lastUpdate"]
      data.results.should be_a Array
      data.activeStations.should be_a Fixnum
      data.totalStations.should be_a Fixnum
      data.lastUpdate.should be_a Fixnum
      data.results.each do |station|
        station.keys.should be == ["id", "status", "latitude", "longitude", "label", "stationAddress", "availableBikes", "availableDocks", "nearbyStations"]
      end
    end
  end

  describe ".stations_status" do
    before do
      stub_get('data2/stations.php?updateOnly=true').
        to_return(:body => fixture("stations_update_only.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the correct resource" do
      @client.stations_status
      a_get('data2/stations.php?updateOnly=true').should have_been_made
    end

    it "should return the stations status" do
      data = @client.stations_status
      data.keys.should be == ["ok", "meta", "results", "lastUpdate"]
      data.results.should be_a Array
      data.lastUpdate.should be_a Fixnum
      data.results.each do |station|
        station.keys.should be == ["id", "status", "availableBikes", "availableDocks"]
      end
    end
  end
end
