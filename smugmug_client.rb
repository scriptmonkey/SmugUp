class SmugmugClient
  attr_reader :api_key, :api_secret

  def initialize(api_key="", api_secret="")
    @api_key = api_key
    @api_secret = api_secret
  end 

  def connectable?
    not @api_key.empty? and not @api_secret.empty?
  end
end
