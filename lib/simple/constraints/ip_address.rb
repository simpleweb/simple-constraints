require 'ipaddr'

module Simple
  module Constraints
    # Extension to the Rails router for matching IP addresses or IP ranges.
    #
    # ## Example
    #
    #     My::Application.routes.draw do
    #
    #       # Single IP address
    #       ip_address '81.184.116.14' do
    #         namespace :admin do
    #           resources :users
    #         end
    #       end
    #
    #       # IP address range (netmask)
    #       ip_address '81.184.116.0/26' do
    #         resources :secrets
    #       end
    #
    #       # Allow local addresses
    #       ip_address '81.184.116.0/26', allow_localhost: true do
    #         resources :secrets
    #       end
    #
    #       # Use with a mounted Rails Engine
    #       mount ResqueWeb::Engine => '/resque', constraints: ip_address('81.187.116.0/26')
    #
    #       root to: 'pages#home'
    #     end
    #
    class IPAddress

      # Public: create a new instance of the IPAddress constraint
      #
      #   ip_range [String] - IP address with optional netmask
      #   options[allow_localhost] [Boolean] - Whether to allow localhost requests (false)
      #
      # Returns a new IPAddress constraint
      def initialize(ip_range, options = {})
        @ip_range = IPAddr.new(ip_range)
        @allow_localhost = options.fetch(:allow_localhost, false)
      end

      # Public: Expected method to be called by the Rails router.
      # Does the request's remote IP address match the given IP range?
      #
      #   request [ActionDispatch::Request] - Rails request instance
      #
      # Returns Boolean
      def matches?(request)
        remote_ip = IPAddr.new(request.remote_ip)
        ip_range.include?(remote_ip) || local?(remote_ip)
      end

      private

      attr_reader :ip_range, :allow_localhost

      # Internal: Does the given remote IP address look like a localhost address?
      #
      #   remote_ip [IPAddr] - Remote IP address
      #
      # Returns Boolean
      def local?(remote_ip)
        allow_localhost or return false

        (IPAddr.new('127.0.0.1') == remote_ip) || (IPAddr.new('::1') == remote_ip)
      end
    end
  end
end
