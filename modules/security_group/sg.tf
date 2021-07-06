resource "aws_security_group" "frontend" {
    vpc_id = var.vpc_id
    name = "frontend"
    description = "security group that allow ssh and all egress traffic"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = var.frontend_sg_name
    }
}

resource "aws_security_group" "backend" {
    vpc_id = var.vpc_id
    name = "backend"
    description = "security group that allow ssh and all egress traffic"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = var.backend_sg_name
}
}

resource "aws_security_group" "postgres" {
    vpc_id = var.vpc_id
    name = "postgres"
    description = "Allow postgres port"

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [aws_security_group.frontend.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        self = true
    }

    tags =  {
        Name = var.rds_sg_name
    }
}

resource "aws_security_group" "elastiCache" {
    vpc_id = var.vpc_id
    name = "elastiCache_sg"
    description = "Allow elastiCache port"

    ingress {
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        
    }

    tags =  {
        Name = var.elastiCache_sg_name
    }
}

