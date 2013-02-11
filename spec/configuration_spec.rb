require_relative '../configuration'

describe Configuration do

  before(:each) do
    @c = Configuration.new
  end

  it "should respond to config_file" do
    @c.should respond_to(:config_file_name)
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
    @c.config_file_name.should == "~/.SmugUp/smugup.conf"
  end

  it "should accept a location of a config file when created" do
    c = Configuration.new("~/.SmugUp/some_other.conf")
    c.config_file_name.should == "~/.SmugUp/some_other.conf"
  end

  context "when providing a nonexistant file name" do
    before do
     @c = Configuration.new("./spec/support/ohno.conf")
   end

   it "should have the proper default api_key" do
     @c.api_key.should == "default_api_key"
   end
   it "should have the proper default api_secret" do
     @c.api_secret.should == "default_api_secret"
   end
   it "should have the proper default user_token" do
     @c.user_token.should == "default_user_token"
   end
   it "should have the proper default user_secret" do
     @c.user_secret.should == "default_user_scret"
   end

  end


  context "when reading the test config file" do

    before do
     @c = Configuration.new("./spec/support/test.conf")
   end

   it "should have the proper api_key" do
     @c.api_key.should == "1234api_key"
   end
   it "should have the proper api_secret" do
     @c.api_secret.should == "6789api_secret"
   end
   it "should have the proper user_token" do
     @c.user_token.should == "4242user_token"
   end
   it "should have the proper user_secret" do
     @c.user_secret.should == "4545user_scret"
   end
  end
end
