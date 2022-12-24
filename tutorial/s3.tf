# s3 버킷 정의
resource "aws_s3_bucket" "testBucket" {
    bucket  = "must01940-test-bucket" # 고유한 버킷명 필요
    # acl = "private" - acl 설정은 별도 aws_s3_bucket_acl 리소스로 지정
    tags = {
        Name        = "test bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_acl" "testBucketAcl" {
    bucket  = aws_s3_bucket.testBucket.id
    acl     = "private"
}

