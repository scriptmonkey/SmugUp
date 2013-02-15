class Configuration
  attr_accessor :api_key,
                :api_secret,
                :user_token,
                :user_secret,
                :config_file_name

  def initialize(config_file_name="~/.SmugUp/smugup.conf")
    self.config_file_name = config_file_name

    set_to_defaults
    read_config
  end

  def set_to_defaults
    self.api_key     = "default_api_key"
    self.api_secret  = "default_api_secret"
    self.user_token  = "default_user_token"
    self.user_secret = "default_user_scret"
  end

  def default?
    api_key == "default_api_key" || api_secret == "default_api_secret"
  end

  def read_config
    return unless File.exists?(config_file_name)

    h = JSON.parse(File.read(config_file_name))

    self.api_key     = h["api_key"]
    self.api_secret  = h["api_secret"]
    self.user_token  = h["user_token"]
    self.user_secret = h["user_secret"]
  end

  def save_config
    config_hash = {
                    "api_key"     => api_key,
                    "api_secret"  => api_secret,
                    "user_token"  => user_token,
                    "user_secret" => user_secret
                }

    f = File.open(config_file_name, "w")
    f.write(config_hash.to_json)
    f.close
  end
end
