require "sidekiq-scheduler"

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDIS_SERVER", "redis://localhost:6379/3") }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_SERVER", "redis://localhost:6379/3") }
end
