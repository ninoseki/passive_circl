# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module PassiveCIRCL
  module Clients
    class Base
      HOST = "www.circl.lu"
      BASE_URL = "https://#{HOST}"

      def initialize(username:, password:)
        @username = username
        @password = password
      end

      private

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          response = http.request(req)

          code = response.code.to_i
          raise Error, "Unsupported response code returned: #{code}" if code != 200

          body = response.body
          content_type = response["Content-Type"].to_s

          if content_type.include?("application/json")
            yield JSON.parse body
          else
            list = body.lines.map { |line| JSON.parse line }
            yield list
          end
        end
      end

      def _get(path, params = {}, &block)
        uri = url_for(path)
        uri.query = URI.encode_www_form(params)
        get = Net::HTTP::Get.new(uri)
        get.basic_auth @username, @password

        request(get, &block)
      end
    end
  end
end
