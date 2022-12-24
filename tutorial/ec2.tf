# 키페어 생성 후 등록
resource "aws_key_pair" "ec2_key" {
    key_name = "terraTest"
    public_key = file("./key/testPubkey.pub")
}

# 등록된 키페어로 ec2 정의 / ami 지정
resource "aws_instance" "test_ec2" {
    ami = "ami-0002b9f51ae640f9a"
    instance_type = "t3.nano"
    vpc_security_group_ids = [
        aws_security_group.blogPublicSG.id,
    ]
    subnet_id = aws_subnet.blogPublicSubnet.id
    key_name = aws_key_pair.ec2_key.key_name
    root_block_device {
        volume_size = 300
        volume_type = "gp3"
    }
}

