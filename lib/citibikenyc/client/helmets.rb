module Citibikenyc
  class Client
    # Defines methods related to helmets
    module Helmets

      # Returns all information about helmets
      #
      # @param options [Hash] An optional options hash
      # @return [Hashie::Mash]
      # @example Return all information about the helmets
      #   Citibikenyc.helmets
      # @format :json
      def helmets(options={})
        get(helmets_path, options)
      end

      protected

      def helmets_path
        'v1/helmet/list'
      end
    end
  end
end