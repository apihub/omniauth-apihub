module OmniAuth
  module ApiHub
    class Client
      def self.client_options(options)
        ok = %w{site authorize_url token_url}.all? {|param| options.include?(param.to_sym) }
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
