$:.unshift File.dirname(__FILE__) + '/../lib'
require 'citibikenyc'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include WebMock::API
end

def a_delete(path)
  a_request(:delete, Citibikenyc.endpoint + path)
end

def a_get(path)
  a_request(:get, Citibikenyc.endpoint + path)
end

def a_post(path)
  a_request(:post, Citibikenyc.endpoint + path)
end

def a_put(path)
  a_request(:put, Citibikenyc.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, Citibikenyc.endpoint + path)
end

def stub_get(path)
  stub_request(:get, Citibikenyc.endpoint + path)
end

def stub_post(path)
  stub_request(:post, Citibikenyc.endpoint + path)
end

def stub_put(path)
  stub_request(:put, Citibikenyc.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end