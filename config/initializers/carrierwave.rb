CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "shaohuan"
  config.upyun_password = '2013@nus'
  config.upyun_bucket = "wanmen"
  config.upyun_bucket_domain = "img.wanmen.org"
end