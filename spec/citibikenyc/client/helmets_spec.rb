require File.expand_path('../../../spec_helper', __FILE__)

describe Citibikenyc::Client do
  before do
    @client = Citibikenyc::Client.new
  end

  describe ".helmets" do
    before do
      stub_get('v1/helmet/list').
        to_return(:body => fixture("helmets.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the correct resource" do
      @client.helmets
      a_get('v1/helmet/list').should have_been_made
    end

    it "should return the helmets info" do
      data = @client.helmets
      data.keys.should be == ["ok", "meta", "results", "lastUpdate"]
      data.results.should be_a Array
      data.lastUpdate.should be_a Fixnum
      data.results.each do |station|
        station.keys.should be == ["id", "address", "latitude", "longitude", "label"]
      end
    end
  end
end
