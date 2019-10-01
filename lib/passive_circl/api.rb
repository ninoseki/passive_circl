# frozen_string_literal: true

module PassiveCIRCL
  class API
    attr_reader :dns
    attr_reader :ssl

    def initialize(username: ENV["CIRCL_PASSIVE_USERNAME"], password: ENV["CIRCL_PASSIVE_PASSWORD"])
      @dns = Clients::DNS.new(username: username, password: password)
      @ssl = Clients::SSL.new(username: username, password: password)
    end
  end
end
