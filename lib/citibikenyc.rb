require File.expand_path('../citibikenyc/error', __FILE__)
require File.expand_path('../citibikenyc/configuration', __FILE__)
require File.expand_path('../citibikenyc/api', __FILE__)
require File.expand_path('../citibikenyc/client', __FILE__)

module Citibikenyc
  extend Configuration

  # Alias for Citibikenyc::Client.new
  #
  # @return [Citibikenyc::Client]
  def self.client(options={})
    Citibikenyc::Client.new(options)
  end

  # Delegate to Citibikenyc::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Citibikenyc::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
