require "json"

class Configuration
  attr_reader :config_file_name
  attr_accessor :api_key,
                :api_secret,
                :user_token,
                :user_secret

  def initialize(f="~/.SmugUp/smugup.conf")
    @config_file_name = f

    begin
      @config_file = File.new(f,"r")
      read_config

    rescue Errno::ENOENT => e
      #file does not exits reset to default
      set_to_defaults
    end
  end

  def set_to_defaults
    @api_key = "default_api_key"
    @api_secret = "default_api_secret"
    @user_token = "default_user_token"
    @user_secret = "default_user_scret"
  end

  def read_config
    h = JSON.parse(IO.read(@config_file_name))

    @api_key = h["api_key"]
    @api_secret = h["api_secret"]
    @user_token = h["user_token"]
    @user_secret = h["user_secret"]

  end

  def save_config
    config_hash = {
                    "api_key"     => @api_key,
                    "api_secret"  => @api_secret,
                    "user_token"  => @user_token,
                    "user_secret" => @user_secret
                }

    f = File.open(@config_file_name, "w") 
    f.write(config_hash.to_json)
    f.close
  end

end