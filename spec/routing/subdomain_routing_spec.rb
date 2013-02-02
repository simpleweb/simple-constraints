require 'spec_helper'

describe "routing to subdomains" do
  describe "without a subdomain" do
    it "routes to application#index" do
      expect(:get => "http://example.com/").to route_to(
        :controller => "application",
        :action => "index"
      )
    end
  end

  describe "with a subdomain" do
    it "routes to application#subdomain" do
      expect(:get => "http://help.example.com/").to route_to(
        :controller => "application",
        :action => "subdomain"
      )
    end
  end

  describe "with a reserved subdomain" do
    it "routes to application#subdomain" do
      expect(:get => "http://www.example.com/").to route_to(
        :controller => "application",
        :action => "index"
      )
    end
  end
end
