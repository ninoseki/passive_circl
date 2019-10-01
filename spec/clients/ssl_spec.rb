# frozen_string_literal: true

RSpec.describe PassiveCIRCL::Clients::SSL, :vcr do
  let(:api) { PassiveCIRCL::API.new }

  describe "#query" do
    it do
      res = api.ssl.query("172.228.24.0/28")
      expect(res).to be_a(Hash)
    end
  end

  describe "#cquery" do
    it do
      res = api.ssl.cquery("c46fed822dadac3f31f9bb4d1a78a1d9eae4567b")
      expect(res).to be_a(Hash)
    end
  end

  describe "#cfetch" do
    it do
      res = api.ssl.cfetch("7c552ab044c76d1df4f5ddf358807bfdcd07fa57")
      expect(res).to be_a(Hash)
    end
  end
end
