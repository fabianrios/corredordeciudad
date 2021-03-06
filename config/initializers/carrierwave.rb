if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV["S3_BUCKET"]
    config.aws_acl    = :public_read
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
      access_key_id:     ENV["AWS_KEY"],
      secret_access_key: ENV["AWS_SECRET_KEY"]
    }
  end
elsif Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end