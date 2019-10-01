# frozen_string_literal: true

RSpec.describe PassiveCIRCL::Clients::DNS, :vcr do
  let(:api) { PassiveCIRCL::API.new }

  describe "#query" do
    it do
      res = api.dns.query("www.circl.lu")
      expect(res).to be_an(Array)
    end
  end
end
