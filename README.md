# OmniAuth ApiHub

This is the OmniAuth strategy for authenticating to [Api Gateway](https://github.com/apihub/apigateway).

## Usage

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :apihub, ENV['APIHUB_CLIENT_ID'], ENV['APIHUB_CLIENT_SECRET'], { site: ENV['APIHUB_SITE'], authorize_url: ENV['APIHUB_AUTHORIZE_URL'], token_url: ENV['APIHUB_TOKEN_URL'] }
end
```
