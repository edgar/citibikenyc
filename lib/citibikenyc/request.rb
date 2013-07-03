module Citibikenyc
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false, unformatted=true)
      request(:get, path, options, raw, unformatted)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false, unformatted=true)
      request(:post, path, options, raw, unformatted)
    end

    # Perform an HTTP PUT request
    def put(path, options={}, raw=false, unformatted=true)
      request(:put, path, options, raw, unformatted)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, raw=false, unformatted=true)
      request(:delete, path, options, raw, unformatted)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, raw=false, unformatted=true)
      response = connection(raw).send(method) do |request|
        path = formatted_path(path) unless unformatted
        case method
        when :get, :delete
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = options unless options.empty?
        end
      end
      raw ? response : response.body
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
end