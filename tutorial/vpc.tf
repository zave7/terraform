# vpc 리소스 정의
resource "aws_vpc" "blogVPC" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "blog-vpc"
    }
}

# 퍼블릭 서브넷 정의 / vpc 지정
resource "aws_subnet" "blogPublicSubnet" {
    vpc_id = aws_vpc.blogVPC.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        Name = "blog-public-subnet"
    }
}

# 프라이빗 서브넷 정의 / vpc 지정
resource "aws_subnet" "blogPrivateSubnet1" {
    vpc_id = aws_vpc.blogVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        Name = "blog-private_subnet1"
    }
}
resource "aws_subnet" "blogPrivateSubnet2" {
    vpc_id = aws_vpc.blogVPC.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "blog-private-subnet2"
    }
}

# 인터넷 게이트웨이 정의 / vpc 지정
resource "aws_internet_gateway" "blogIGW" {
    vpc_id = aws_vpc.blogVPC.id
    tags = {
        Name = "blog-IGW"
    }
}
