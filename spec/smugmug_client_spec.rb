require_relative '../smugmug_client'

describe SmugmugClient do

  before do
    @smug_client = SmugmugClient.new
  end

  it "should respond to api_key" do
    @smug_client.should respond_to(:api_key)
  end

  it "should respond to api_secret" do
    @smug_client.should respond_to(:api_secret)
  end

  it "should respond to connectable?" do
    @smug_client.should respond_to(:connectable?)
  end

  it "shoult not be connectable without an api_key" do
    sc = SmugmugClient.new
    sc.api_key = ""
    sc.api_secret = "1234"
    sc.should_not be_connectable
  end
 
  it "shoult not be connectable without an api_secret" do
    sc = SmugmugClient.new
    sc.api_key = "1234"
    sc.api_secret = ""
    sc.should_not be_connectable
  end

  it "should be connectable with an api_key and api_secret" do
    sc = SmugmugClient.new
    sc.api_key = "1234"
    sc.api_secret = "1234"
    sc.should be_connectable
    
  end

end