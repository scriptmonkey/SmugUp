require_relative '../configuration'

describe Configuration do

  before(:each) do
    @c = Configuration.new
  end

  it "should respond to config_file" do
    @c.should respond_to(:config_file)
  end

  it "should respond to api_key" do
    @c.should respond_to(:api_key)
  end

  it "should respond to api_secret" do
    @c.should respond_to(:api_secret)
  end

  it "should respond to user_token" do
    @c.should respond_to(:user_token)
  end

  it "should respond to user_secret" do
    @c.should respond_to(:user_secret)
  end

  it "should have a default location of accept a location of ~/.SmugUp/smugup.conf" do
    @c.config_file.should == "~/.SmugUp/smugup.conf"
  end

  it "should accept a location of a config file when created" do
    c = Configuration.new("~/.SmugUp/some_other.conf")
    c.config_file.should == "~/.SmugUp/some_other.conf"
  end

end
