# By default, "redis-rb" first tries to connect to the URL set in the ENV['REDIS_URL']
# and uses localhost:6379 as as fallback

ENV['REDIS_URL'] = ENV['REDISCLOUD_URL'] if ENV['REDISCLOUD_URL']
