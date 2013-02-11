class Configuration
  attr_reader :config_file,
              :api_key,
              :api_secret,
              :user_token,
              :user_secret

  def initialize(f="~/.SmugUp/smugup.conf")
    @config_file = f
  end

  

end