## Development

```
$ docker build . -t nginx-s3-x-accel-redirect && docker run --rm -p 80:80 nginx-s3-x-accel-redirect

$ export S3_BUCKET_NAME=... AWS_ACCESS_KEY=... AWS_SECREAT_ACCESS_KEY=...
$ rails s

$ curl http://localhost/sample
```