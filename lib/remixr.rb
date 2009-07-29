require 'forwardable'
require 'rubygems'

gem 'mash', '0.0.3'
require 'mash'

gem 'httparty', '0.4.3'
require 'httparty'

class APIKeyNotSet   < StandardError; end

module Remixr
  
  def self.api_key
    raise APIKeyNotSet if @api_key.nil?
  
    @api_key
  end
  
  def self.api_key=(api_key)
    @api_key = api_key
  end
  
  def self.default_params
    {:apiKey => self.api_key, :format => 'json'}
  end
  
end

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'remixr', 'stores')