require 'spec_helper'

describe OmniAuth::ApiHub::Client do
  let(:options) {
    {
      site: 'https://apihub.example.org',
      authorize_url: 'https://apihub.example.org/login/oauth/authorize',
      token_url: 'https://apihub.example.org/login/oauth/access_token'
    }
  }
  it "raises an exception when missing required params" do
    expect{ OmniAuth::ApiHub::Client.client_options }.to raise_error(ArgumentError)
  end

  it "returns client_options struture for omniauth" do
    expect(OmniAuth::ApiHub::Client.client_options(options)).to eq options
  end
end