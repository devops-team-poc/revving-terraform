output  "security_group_rds" {
value = aws_db_instance.postgres.vpc_security_group_ids
}

output  "rds_subnet_ids" {
value = aws_db_subnet_group.postgres-subnet.subnet_ids
}


