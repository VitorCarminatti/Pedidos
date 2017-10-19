Aws.config.update(
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  http_proxy: ENV['HTTP_PROXY'],
  region: ENV['AWS_REGION'],
  stub_responses: Rails.env.test?
)
