if ENV["REDISCLOUD_URL"]
  location = ENV["REDISCLOUD_URL"]
else
  location =  'redis://127.0.0.1:6379/0'
end

$redis = Redis.new(:url => location)
