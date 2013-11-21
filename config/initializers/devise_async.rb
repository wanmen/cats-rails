# Supported options: :resque, :sidekiq, :delayed_job
Devise::Async.setup do |config|
  config.enabled = true
  config.backend = :sidekiq
  #config.queue   = :my_custom_queue
end