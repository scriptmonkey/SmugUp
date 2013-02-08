require_relative '../smugmug_client'

describe SmugmugClient do

  #use_vcr_cassette "feed", :record => :new_episodes

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


end