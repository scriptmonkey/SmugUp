require_relative '../configuration'

describe Configuration do

  before(:each) do
    @c = Configuration.new
  end

  it "should respond to config_file_name" do
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

  it "should have a default location of config file a location of ~/.SmugUp/smugup.conf" do
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

    it "should report being default" do
      @c.should be_default
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
    it "should not report being default" do
      @c.should_not be_default
    end

  end

  context "when needing to write config changes" do
    it "should write out a proper config file" do

      #there has to be a better way to do this test, right?

      c = Configuration.new("./spec/support/write_config_test.conf")
      c.api_key = "new_api_key"
      c.api_secret = "new_api_secret"
      c.user_token = "new_user_token"
      c.user_secret = "new_user_secret"
      c.save_config
      d = Configuration.new("./spec/support/write_config_test.conf")
      d.api_key.should == "new_api_key"
      d.api_secret.should == "new_api_secret"
      d.user_token.should == "new_user_token"
      d.user_secret.should == "new_user_secret"
      File.delete("./spec/support/write_config_test.conf")
    end
  end


end
