module Citibikenyc
  class Client < API

    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include Citibikenyc::Client::Stations
    include Citibikenyc::Client::Helmets
    include Citibikenyc::Client::Branches
  end
end