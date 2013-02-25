require_relative '../smugmug_client'
require_relative '../configuration'
require "spec_helper"

describe SmugmugClient, :vcr do

  before do
    @config = Configuration.new
    @config.api_key = "key"
    @config.api_secret = "seceret"
    @smug_client = SmugmugClient.new(@config)
  end

  it "should not report valid with invalid keys" do
    @smug_client.should_not be_valid_api_token
  end


  context "when given a valid api token" do

    before do
      c = Configuration.new("../.keys/SmugUp-API.conf")      
      @sc = SmugmugClient.new(c)
    end

    it "should report valid keys with a valid api token and invalid user token" do
      @sc.should be_valid_api_token
    end

    it "should not report a valid connection" do
      @sc.should_not be_connectable
    end
  end

  context "when given a valid api token and valid user token" do

    before do
      c = Configuration.new("../.keys/SmugUp-Both.conf")      
      @sc = SmugmugClient.new(c)
    end

    it "should report valid keys with a valid api token" do
      @sc.should be_valid_api_token
    end

    it "should report a valid connection" do
      @sc.should be_connectable
    end

    it "should be able to check for the non existance of a specific Smugmug album that does not exists" do
      @sc.album_exists?("ThisBetterNotExist").should be_false
    end

    it "should be able to check for the existance of a specific Smugmug album that does exists" do
      @sc.album_exists?("SmugUp").should be_true
    end

  end
end