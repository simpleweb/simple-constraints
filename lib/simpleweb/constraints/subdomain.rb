module Simpleweb
  module Constraints

    def subdomain(*args, &block)
      constraints Subdomain.new(*args), &block
    end

    # Extension to the Rails router for matching subdomains.
    #
    # You can either use the `:only` option, which accepts a string or an
    # array of strings, to only match a particular set of subdomains, or an
    # `:expect` option (also accepts string or array of strings), which will
    # match all subdomains except the ones given.
    #
    # You can also give a `:tld_length` option, which configures the top
    # level domain size (1 for .com, 2 for .co.uk etc).
    #
    # ## Example
    #
    #     My::Application.routes.draw do
    #       subdomain only: 'blog' do
    #         resources :posts
    #       end
    #
    #       subdomain except: ['www', 'mail'] do
    #         resources :spaces
    #         root to: 'spaces#index'
    #       end
    #
    #       root to: 'pages#home'
    #     end
    #
    class Subdomain
      # Create a new Subdomain constraint.
      #
      # @param [Hash] options The options to configure the constraint.
      # @option options [Integer] :tld_length (1) The top level domain size.
      # @option options [String|Array] :only ([]) Only match these subdomains
      # @option options [String|Array] :except ([]) Don't match these subdomains
      def initialize(options = {})
        @tld_length = options[:tld_length] || 1
        @only = Array(options[:only])
        @except = Array(options[:except])
      end

      # Does the request match the constraint.
      #
      # The `:only` option from {#initialize} takes precedence, if it's present, then the
      # `:except` option is ignored.
      #
      # @param [ActionDispatch::Request] request The request to test for a match.
      def matches?(request)
        subdomain = request.subdomain(tld_length)
        if subdomain.present?
          if only.present?
            return only.include?(subdomain)
          end

          return !except.include?(subdomain)
        end
        false
      end

      private

      attr_reader :tld_length
      attr_reader :except
      attr_reader :only
    end
  end
end
