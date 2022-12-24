## 퍼블릭 라우팅 테이블 정의
resource "aws_route_table" "blogPublicRoute" {
    vpc_id = aws_vpc.blogVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.blogIGW.id
    }
    tags = {
        Name = "blog-public-route"
    }
}

## 프라이빗 라우팅 테이블 정의
resource "aws_route_table" "blogPrivateRoute1" {
    vpc_id = aws_vpc.blogVPC.id

    tags = {
        Name = "blog-private-route"
    }
}

resource "aws_route_table" "blogPrivateRoute2" {
    vpc_id = aws_vpc.blogVPC.id

    tags = {
        Name = "blog-private-route"
    }
}

## 퍼블릭 라우팅 테이블 연결
resource "aws_route_table_association" "blogPublicRTAssociation" {
    subnet_id = aws_subnet.blogPublicSubnet.id
    route_table_id = aws_route_table.blogPublicRoute.id
}
## 프라이빗 라우팅 테이블 연결
resource "aws_route_table_association" "blogPrivateRTAssociation1" {
    subnet_id = aws_subnet.blogPrivateSubnet1.id
    route_table_id = aws_route_table.blogPrivateRoute1.id
}
resource "aws_route_table_association" "blogPrivateRTAssociation2" {
    subnet_id = aws_subnet.blogPrivateSubnet2.id
    route_table_id = aws_route_table.blogPrivateRoute2.id
}
