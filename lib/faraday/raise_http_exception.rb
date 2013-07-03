require 'faraday'

# @private
module FaradayMiddleware
  # @private
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 404
          raise Citibikenyc::NotFound, error_message(response)
        end
      end
    end

    def initialize(app)
      super app
      @parser = nil
    end

    private

    def error_message(response, body=nil)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{[response[:status].to_s, body ? body : response[:body]].compact.join(': ')}"
    end
  end
end