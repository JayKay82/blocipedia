CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'aws',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'eu-west-1'
  }
  config.fog_directory = ENV['AWS_BUCKET']
  config.fog_public = true
end
