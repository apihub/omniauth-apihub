# OmniAuth Backstage

This is the OmniAuth strategy for authenticating to [Backstage](https://github.com/backstage/backstage).

## Usage

```ruby
  use OmniAuth::Builder do
    provider :backstage, ENV['BACKSTAGE_CLIENT_ID'], ENV['BACKSTAGE_CLIENT_SECRET'], { site: ENV['BACKSTAGE_SITE'], authorize_url: ENV['BACKSTAGE_AUTHORIZE_URL'], token_url: ENV['BACKSTAGE_TOKEN_URL'] }
  end
```