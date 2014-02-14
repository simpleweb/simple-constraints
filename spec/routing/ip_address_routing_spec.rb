require 'spec_helper'

# @see spec/dummy/config/routes.rb

describe "routing by ip address" do
  before { stub_remote_ip('1.1.1.1') }

  context "without a matching ip address" do
    it "does not route anywhere" do
      expect(get: "http://example.com/").to route_to(
        controller: "application",
        action: "index"
      )
    end
  end

  context "with a matching ip address" do
    before { stub_remote_ip('81.184.116.14') }

    it "routes to admin/users#index" do
      expect(get: "http://example.com/").to route_to(
        controller: "application",
        action: "admin"
      )
    end
  end
end
