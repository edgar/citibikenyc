module Citibikenyc
  class Client
    # Defines methods related to branches
    module Branches

      # Returns all information about branches
      #
      # @param options [Hash] An optional options hash
      # @return [Hashie::Mash]
      # @example Return all information about the branches
      #   Citibikenyc.branches
      # @format :json
      def branches(options={})
        get(branches_path, options)
      end

      protected

      def branches_path
        'v1/branch/list'
      end
    end
  end
end