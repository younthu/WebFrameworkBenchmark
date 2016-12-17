# NodeBenchmark
repository for node benchmark

# Case 1, 查询当前时间

## Rails 5 api,
用rails 5 api模式生成一个api

```ruby
rails new my_api --api
bundle install
rails g scaffold time_provider stamp short_string

# TimeProvidersController
def now
  render json:DateTime.now
end

# routes.rb
get "/now", to: "time_providers#now"
```
