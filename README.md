hi

## Local Setup

```rb
# env.rb
ENV['songkick_api_key'] = "your songkick api key"
```

```
bundle install
bundle exec rake db:migrate
bundle exec rackup
```
