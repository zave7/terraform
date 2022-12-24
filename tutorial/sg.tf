## 퍼블릭 보안 그룹
resource "aws_security_group" "blogPublicSG" {
    vpc_id = aws_vpc.blogVPC.id
    name = "blog public SG"
    description = "blog public SG"
    tags = {
        Name = "blog public SG"
    }
}

## 프라이빗 보안 그룹
resource "aws_security_group" "blogPrivateSG" {
    vpc_id = aws_vpc.blogVPC.id
    name = "blog private SG"
    description = "blog private SG"
    tags = {
        Name = "log private SG"
    }
}

## 퍼블릭 보안 그룹 규칙
resource "aws_security_group_rule" "blogPublicSGRulesHTTPingress" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}
resource "aws_security_group_rule" "blogPublicSGRulesHTTPegress" {
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}
resource "aws_security_group_rule" "blogPublicSGRulesHTTPSingress" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "blogPublicSGRulesHTTPSegress" {
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "blogPublicSGRulesSSHingress" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/32" ] # ssh 접속 ip 별도 지정 필요
    security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "blogPublicSGRulesSSHegress" {
    type = "egress"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/32" ] # ssh 접속 ip 별도 지정 필요
    security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}

### Private Security Group rules
resource "aws_security_group_rule" "blogPrivateSGRulesRDSingress" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    security_group_id = aws_security_group.blogPrivateSG.id
    # cidr 지정이 아닌 보안 그룹으로 지정
    source_security_group_id = aws_security_group.blogPublicSG.id 
    lifecycle {
        create_before_destroy = true
    }
}
resource "aws_security_group_rule" "blogPrivateSGRulesRDSegress" {
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    security_group_id = aws_security_group.blogPrivateSG.id
    source_security_group_id = aws_security_group.blogPublicSG.id
    lifecycle {
        create_before_destroy = true
    }
}

























