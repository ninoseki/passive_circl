# frozen_string_literal: true

module PassiveCIRCL
  module Clients
    class DNS < Base
      def query(value)
        _get("/pdns/query/#{value}") { |json| json }
      end
    end
  end
end
