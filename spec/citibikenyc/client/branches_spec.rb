require File.expand_path('../../../spec_helper', __FILE__)

describe Citibikenyc::Client do
  before do
    @client = Citibikenyc::Client.new
  end

  describe ".branches" do
    before do
      stub_get('v1/branch/list').
        to_return(:body => fixture("branches.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the correct resource" do
      @client.branches
      a_get('v1/branch/list').should have_been_made
    end

    it "should return the branches info" do
      data = @client.branches
      data.keys.should be == ["ok", "meta", "results", "lastUpdate"]
      data.results.should be_a Array
      data.lastUpdate.should be_a Fixnum
      data.results.each do |station|
        station.keys.should be == ["id", "latitude", "longitude", "label"]
      end
    end
  end
end
