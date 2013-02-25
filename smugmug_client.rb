require 'bundler/setup'
require 'ruby-smugmug'
Bundler.require

require_relative './configuration'

class SmugmugClient
  attr_accessor :req_token, :api_key, :api_secret, :config, :consumer, :client

  def initialize(config)
    self.config = config


    self.consumer = OAuth::Consumer.new(config.api_key, config.api_secret,
                { :site => 'https://api.smugmug.com',
                  :request_token_path => "/services/oauth/getRequestToken.mg",
                  :access_token_path => "/services/oauth/getAccessToken.mg",
                  :authorize_path => "/services/oauth/authorize.mg",
                  :proxy => "http://localhost:3128"
                })


    self.client = SmugMug::Client.new(:api_key => config.api_key,
                             :oauth_secret => config.api_secret, 
                             :user => {:token => config.user_token, :secret => config.user_secret},
                             :http => {:proxy_host => 'localhost', :proxy_port => 3128}
                             )

  end 

  def valid_api_token?
    begin
      self.req_token = consumer.get_request_token
      req_token.class == OAuth::RequestToken
    rescue Exception => e
      false
    end
  end

  def connectable?
    begin
      client.auth.checkAccessToken
    rescue Exception => e
      false
    end
  end

  def album_exists?(album)
#    client.albums.get.reduce { |there, h| h["Title"] == album}
    !client.albums.get.select { | h| h["Title"] == album }.empty?

    

 #   there = false
  #  album_list.each_entry do |h|
   #   there = true if h["Title"] == album
    #end
    #there

  end

end
