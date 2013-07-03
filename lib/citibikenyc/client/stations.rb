module Citibikenyc
  class Client
    # Defines methods related to stations
    module Stations

      # Returns all information about stations
      #
      # @param options [Hash] An optional options hash
      # @return [Hashie::Mash]
      # @example Return all information about the stations
      #   Citibikenyc.stations
      # @format :json
      def stations(options={})
        get(stations_path, options)
      end

      # Returns only the stations status
      #
      # @param options [Hash] An optional options hash
      # @return [Hashie::Mash]
      # @example Returns only the stations status
      #   Citibikenyc.stations_status
      # @format :json
      def stations_status(options={})
        get(stations_path, options.merge(:updateOnly => true))
      end

      protected

      def stations_path
        'data2/stations.php'
      end
    end
  end
end