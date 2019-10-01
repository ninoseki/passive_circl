# frozen_string_literal: true

require "passive_circl/version"

require "passive_circl/clients/base"

require "passive_circl/clients/ssl"
require "passive_circl/clients/dns"

require "passive_circl/api"

module PassiveCIRCL
  class Error < StandardError; end
end
