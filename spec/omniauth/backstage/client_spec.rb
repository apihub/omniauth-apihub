require 'spec_helper'

describe OmniAuth::Backstage::Client do
  let(:options) {
    {
      site: 'https://backstage.example.org',
      authorize_url: 'https://backstage.example.org/login/oauth/authorize',
      token_url: 'https://backstage.example.org/login/oauth/access_token'
    }
  }
  it "raises an exception when missing required params" do
    expect{ OmniAuth::Backstage::Client.client_options }.to raise_error(ArgumentError)
  end

  it "returns client_options struture for omniauth" do
    expect(OmniAuth::Backstage::Client.client_options(options)).to eq options
  end
end