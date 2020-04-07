class SampleController < ApplicationController

  def index
    path = '/hoge.txt'
    url = "https://#{ENV['S3_BUCKET_NAME']}.s3-ap-northeast-1.amazonaws.com#{path}"

    signer = Aws::Sigv4::Signer.new(
        service: 's3',
        region: 'ap-northeast-1',
        access_key_id: ENV['AWS_ACCESS_KEY'],
        secret_access_key: ENV['AWS_SECREAT_ACCESS_KEY']
        )

    signature = signer.sign_request(
        http_method: 'GET',
        url: url
    )
    signature.headers.each do |key, val|
      headers[key] = val
    end

    headers['X-Accel-Redirect'] = "/x-files#{path}"

    head :ok
  end

end
