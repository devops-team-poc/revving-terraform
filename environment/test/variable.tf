#PROVIDER

variable "terraform_region" {}

variable "iam_access_key" {}

variable "iam_secret_key" {}


#VPC

variable "vpc_cidr_block" {}

variable "vpc_name" {}

variable "tenancy" {}

variable "pub1_sub_cidr" {}

variable "pub1_sub_name" {}

variable "pub1_sub_az" {}

variable "private1_sub_cidr" {}

variable "private1_sub_name" {}

variable "private1_sub_az" {}

variable "private2_sub_cidr" {}

variable "private2_sub_name" {}

variable "private2_sub_az" {}

variable "IGW_name" {}

variable "route_table_public_name" {} 


#SECURITY_GROUP
#variable "vpc_id" {}

variable "frontend_sg_name" {}

variable "backend_sg_name" {}

variable "rds_sg_name" {}

variable "elastiCache_sg_name" {}


#EC2
variable "ami_id" {}

variable "instance_type" {}

variable "pem_key_name" {}

variable "frontend_instance_name" {}

variable "backend_instance_name" {}

#variable "public_subnet_id" {}

#variable "private1_subnet_id" {}

#variable "frontend_sg" {}

#variable "backend_sg" {}

#variable "frontend_eip" {}

#variable "backend_eip" {}


#EIP
#variable "frontend_eip" {}

#variable "backend_eip" {}

variable "eip_frontend_name" {}

variable "eip_backend_name" {}

    
#RDS
variable "rds_name" {}

variable "postgres_subnet_name" {}

variable "rds_allocated_storage" {}

variable "rds_storage_type" {}

variable "rds_instance_class" {}

variable "rds_password" {}

variable "rds_multi_az" {}

variable "rds_backup_retention_period" {}

variable "rds_skip_final_snapshot" {}

variable "rds_deletion_protection" {}

variable "rds_tag_name" {}

#variable "postgres_sg" {}

#variable "subnet_ids" {}

#variable "availability_zone" {}

#variable "kms_key_id" {}

#variable "private_availability_zone" {}


#ELASTICACHE
variable "elasticache_cluster_id" {}

variable "elasticache_node_type" {}

variable "elasticache_snapshot_retention_limit" {}

variable "elasticache_apply_immediately" {}

#variable "elasticache_subnet_group_name" {}

variable "elasticache_availability_zone" {}

variable "elasticache_az_mode" {}

#variable "elasticache_security_group_ids" {}

#variable "elastiCache_sg_name" {}

#KMS
variable "kms_deletion_window_in_days" {}

variable "kms_enable_key_rotation" {}

variable "kms_tag_name" {}

variable "kms_name" {}


#S3
variable "bucket_name" {}

variable "bucket_acl" {}

variable "bucket_versioning_enabled" {}

variable "bucket_tag_environment" {}

variable "bucket_tag_name" {}

#SNS
variable "sns_topic_name" {}




