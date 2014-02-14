require 'spec_helper'

# @see spec/dummy/config/routes.rb

describe "routing to subdomains" do
  before { stub_remote_ip('1.1.1.1') }

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

  describe ":except" do
    it "routes to application#index" do
      expect(:get => "http://www.example.com/").to route_to(
        :controller => "application",
        :action => "index"
      )
    end
  end

  describe ":only" do
    it "matches the given subdomain" do
      expect(:get => "http://blog.example.com/").to route_to(
        :controller => "application",
        :action => "blog"
      )
    end
  end
end
