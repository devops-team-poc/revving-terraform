resource "aws_db_subnet_group" "postgres-subnet" {
    name = var.postgres_subnet_name
    description = "RDS subnet group"
    subnet_ids = [ var.private1_subnet_id,var.private2_subnet_id ]
}



resource "aws_db_instance" "postgres" {
    allocated_storage = var.rds_allocated_storage
    storage_type = var.rds_storage_type
    engine = "postgres"
    engine_version = "11.10"
    instance_class = var.rds_instance_class # Only for the free tier
    name = var.rds_name
    username = "user1"
    password = var.rds_password
    db_subnet_group_name = aws_db_subnet_group.postgres-subnet.name
    #parameter_group_name = aws_db_parameter_group.postgres-parameters.name
    multi_az = var.rds_multi_az        # set is true to have HIGH AVALABILITY : 2 instance synchronized with each other
    vpc_security_group_ids = [ var.postgres_sg ]
    backup_retention_period = var.rds_backup_retention_period           #Time period to keep backup
    availability_zone = var.private_availability_zone     #preffered AZ
    skip_final_snapshot = var.rds_skip_final_snapshot # Skip final snapshot while doing "terraform destory"
    deletion_protection     = var.rds_deletion_protection # skip asking for deletion

    tags = {
        Name = var.rds_tag_name
    }

}


