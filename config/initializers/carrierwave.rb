if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = "hrsolutions"
    config.aws_acl    = :public_read
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
      access_key_id:     "AKIAJBKYNINPYXQBZANQ",
      secret_access_key: "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"
    }
  end
elsif Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end