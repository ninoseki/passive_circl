# frozen_string_literal: true

module PassiveCIRCL
  module Clients
    class SSL < Base
      VERSION = "v2"

      def query(cidr)
        _get("/query/#{cidr}") { |json| json }
      end

      def cquery(fingerprint)
        _get("/cquery/#{fingerprint}") { |json| json }
      end

      def cfetch(fingerprint)
        _get("/cfetch/#{fingerprint}") { |json| json }
      end

      private

      def url_for(path)
        URI(BASE_URL + "/#{VERSION}pssl" + path)
      end
    end
  end
end
