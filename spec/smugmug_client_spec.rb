require_relative '../smugmug_client'
require "spec_helper"

describe SmugmugClient, :vcr do

  before do
    @smug_client = SmugmugClient.new("key","seceret")
  end

  it "should accept the api information as arguments" do
    @smug_client.api_key.should == "key"
    @smug_client.api_secret.should == "seceret"
  end

  it "shoult not be connectable without an api_key" do
    sc = SmugmugClient.new("","1234")
    sc.should_not be_connectable
  end
 
  it "shoult not be connectable without an api_secret" do
    sc = SmugmugClient.new("1234")
    sc.should_not be_connectable
  end

  it "should be connectable with an api_key and api_secret" do
    sc = SmugmugClient.new("1234", "1234")
    sc.should be_connectable
  end

  it "should not report valid with invalid keys" do
    @smug_client.should_not be_valid_api_token
  end


  context "when given a valid api token" do

    before do
      c = Configuration.new("../.keys/SmugUp.conf")      
      @sc = SmugmugClient.new(c.api_key,c.api_secret)
    end

    it "should report valid keys with a valid api token" do
      @sc.should be_valid_api_token
    end
  end
end