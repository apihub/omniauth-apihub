module OmniAuth
  module Backstage
    class Client
      def self.client_options(options)
        ok = %w{site authorize_url token_url}.all? {|param| options.include?(param) }
        raise ArgumentError, 'Missing required parameters.' unless ok

        {
          site: options[:site],
          authorize_url: options[:authorize_url],
          token_url: options[:token_url]
        }
      end
    end
  end
end
