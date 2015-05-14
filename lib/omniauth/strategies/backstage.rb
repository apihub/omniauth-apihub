require 'omniauth-oauth2'
require "omniauth/backstage/client"
require 'base64'

module OmniAuth
  module Strategies
    class Backstage < OmniAuth::Strategies::OAuth2
      option :name, 'backstage'
      option :client_options, nil

      uid { raw_info['email'].to_s }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email'],
          username: raw_info['username']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def initialize(app, *args, &block)
        super(app, *args, &block)
        options[:client_options] = OmniAuth::Backstage::Client.client_options(options) if options.client_options.nil?
      end

      def raw_info
        payload = access_token.get('me').parsed
        @raw_info ||= payload[:user]
      end

      def build_access_token
        options.token_params.merge!(:headers => {'Authorization' => basic_auth_header })
        super
      end

      private
      def basic_auth_header
        "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end
    end
  end
end