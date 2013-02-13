require_relative '../ruby-smugmug/lib/ruby-smugmug'
require "oauth"
require_relative './configuration'

class SmugmugClient
  attr_reader :api_key, :api_secret

  def initialize(api_key="", api_secret="")
    @api_key = api_key
    @api_secret = api_secret

    @consumer = OAuth::Consumer.new(api_key, api_secret,
                { :site => 'https://api.smugmug.com',
                  :request_token_path => "/services/oauth/getRequestToken.mg",
                  :access_token_path => "/services/oauth/getAccessToken.mg",
                  :authorize_path => "/services/oauth/authorize.mg",
                  :proxy => "http://localhost:3128"
                })

  end 

  def connectable?
    not @api_key.empty? and not @api_secret.empty?
  end

  def valid_api_token?
    begin
      req_token = @consumer.get_request_token
      req_token.class == OAuth::RequestToken
    rescue Exception => e
      false
    end

  end
end
