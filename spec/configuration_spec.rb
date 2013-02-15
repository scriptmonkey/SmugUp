require_relative '../configuration'

describe Configuration do

  subject(:config) { Configuration.new }

  it {should respond_to(:config_file_name)}
  it {should respond_to(:api_key)}
  it {should respond_to(:api_secret)}
  it {should respond_to(:user_token)}
  it {should respond_to(:user_secret)}

  it "should have a default location of config file a location of ~/.SmugUp/smugup.conf" do
    config.config_file_name.should == "~/.SmugUp/smugup.conf"
  end

  it "should accept a location of a config file when created" do
    c = Configuration.new("~/.SmugUp/some_other.conf")
    c.config_file_name.should == "~/.SmugUp/some_other.conf"
  end

  context "when providing a nonexistant file name" do
    subject(:config) { Configuration.new("./spec/support/ohno.conf")}

    it {config.api_key.should     == 'default_api_key'}
    it {config.api_secret.should  == 'default_api_secret'}
    it {config.user_token.should  == 'default_user_token'}
    it {config.user_secret.should == 'default_user_scret'}

    it "should report being default" do
      config.should be_default
    end
  end

  context "when reading the test config file" do
    subject(:config) {Configuration.new('./spec/support/test.conf') }

    it {config.api_key.should     == '1234api_key'}
    it {config.api_secret.should  == '6789api_secret'}
    it {config.user_token.should  == '4242user_token'}
    it {config.user_secret.should == '4545user_scret'}

    it "should not report being default" do
      config.should_not be_default
    end

  end

  context "when needing to write config changes" do
    let(:output_file) {'./spec/support/write_config_test.conf'}
    let(:expected_output) do
      '{"api_key":"new_api_key","api_secret":"new_api_secret","user_token":"new_user_token","user_secret":"new_user_secret"}'
    end

    after do
      File.delete(output_file) if File.exists?(output_file)
    end

    it "should write out a proper config file" do
      c = Configuration.new(output_file)
      c.api_key     = "new_api_key"
      c.api_secret  = "new_api_secret"
      c.user_token  = "new_user_token"
      c.user_secret = "new_user_secret"
      c.save_config

      File.read(output_file).should == expected_output
    end
  end
end
