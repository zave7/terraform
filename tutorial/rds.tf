resource "aws_db_subnet_group" "testDBSubnet" {
    name        = "subnet_rds"
    # db 서브넷 그룹은 최소 2개 이상의 서브넷을 지정해 줘야 한다.
    subnet_ids  = [
        aws_subnet.blogPrivateSubnet1.id,
        aws_subnet.blogPrivateSubnet2.id,
    ]

    tags = {
        Name = "test db subnet group"
    }
}

resource "aws_db_instance" "test_rds" {
    # rds db 서브넷 그룹을 지정하지 않으면 default vpc에 생성한다.
    db_subnet_group_name    = aws_db_subnet_group.testDBSubnet.id
    allocated_storage       = 50
    max_allocated_storage   = 80
    engine                  = "mysql"
    engine_version          = "8.0.31"
    instance_class          = "db.t2.micro"
    name                    = "testDB"
    username                = "guestUser"
    password                = "testtest"
    skip_final_snapshot     = true # 인스턴스 제거 시 최종 스냅샷을 만들지 않고 제거하는 옵션 (default:true)
    vpc_security_group_ids  = [
        aws_security_group.blogPrivateSG.id,
    ]
    tags = {
        "name" = "testDB"
    }
}

