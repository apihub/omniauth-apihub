require 'spec_helper'

describe OmniAuth::Strategies::Backstage do
  let(:access_token) { double('AccessToken', options: {}) }
  let(:user) { double('User') }
  let(:parsed_response) { double('Parsed Response', :[] => user) }
  let(:response) { double('Response', :parsed => parsed_response) }

  let(:backstage) do
    OmniAuth::Strategies::Backstage.new('CLIENT_ID', 'CLIENT_SECRET',{
        client_options: {
          site: 'https://backstage.example.org',
          authorize_url: 'https://backstage.example.org/login/oauth/authorize',
          token_url: 'https://backstage.example.org/login/oauth/access_token'
        }
      }
    )
  end

  subject do
    OmniAuth::Strategies::Backstage.new({})
  end

  context "client options" do
    it 'raises an exception if required params are not provided' do
      expect{ subject }.to raise_error(ArgumentError)
    end

    describe "initializiation" do
      it "site endpoint" do
        expect(backstage.options.client_options.site).to eq('https://backstage.example.org')
      end

      it "authorize url endpoint" do
        expect(backstage.options.client_options.authorize_url).to eq('https://backstage.example.org/login/oauth/authorize')
      end

      it "token endpoint" do
        expect(backstage.options.client_options.token_url).to eq('https://backstage.example.org/login/oauth/access_token')
      end
    end
  end

  context "#raw_info" do
    it "returns user info" do
      allow(backstage).to receive(:access_token).and_return(access_token)
      allow(access_token).to receive(:get).with('me').and_return(response)
      expect(backstage.raw_info).to eq(user)
    end
  end

  context 'info' do
    before(:each) do
      backstage.stub(:raw_info).and_return({})
    end

    it 'has name key' do
      expect(backstage.info).to have_key(:name)
    end

    it 'has email key' do
      expect(backstage.info).to have_key(:email)
    end

    it 'has username key' do
      expect(backstage.info).to have_key(:username)
    end
  end

  context 'extra' do
    it 'returns raw user info' do
      backstage.stub(:raw_info).and_return({ name: 'Alice', username: 'alice', email: 'alice@example.org'})

      expect(backstage.extra).to have_key(:raw_info)
      %w{name username email}.each do |k|
        expect(backstage.extra[:raw_info]).to have_key(k.to_sym)
      end
    end
  end
end