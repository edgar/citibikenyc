require 'spec_helper'

describe Citibikenyc do
  after do
    Citibikenyc.reset
  end

  context "when delegating to a client" do
    before do
      stub_get("data2/stations.php").
       to_return(:body => fixture("stations.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the correct resource" do
      Citibikenyc.stations()
      a_get("data2/stations.php").should have_been_made
    end

    it "should return the same results as a client" do
      Citibikenyc.stations().should == Citibikenyc::Client.new.stations()
    end
  end

  describe ".client" do
    it "should be a Citibikenyc::Client" do
      Citibikenyc.client.should be_a Citibikenyc::Client
    end

  describe ".adapter" do
    it "should return the default adapter" do
      Citibikenyc.adapter.should == Citibikenyc::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      Citibikenyc.adapter = :typhoeus
      Citibikenyc.adapter.should == :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      Citibikenyc.endpoint.should == Citibikenyc::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      Citibikenyc.endpoint = 'http://edgar.com.ve'
      Citibikenyc.endpoint.should == 'http://edgar.com.ve'
    end
  end

  describe ".format" do
    it "should return the default format" do
      Citibikenyc.format.should == Citibikenyc::Configuration::DEFAULT_FORMAT
    end
  end

  describe ".format=" do
    it "should set the format" do
      Citibikenyc.format = 'xml'
      Citibikenyc.format.should == 'xml'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      Citibikenyc.user_agent.should == Citibikenyc::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      Citibikenyc.user_agent = 'Custom User Agent'
      Citibikenyc.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".configure" do
    Citibikenyc::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Citibikenyc.configure do |config|
          config.send("#{key}=", key)
          Citibikenyc.send(key).should == key
        end
      end
    end
  end

  end
end