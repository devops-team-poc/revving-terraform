provider "aws" {
  region = var.terraform_region
}

module "vpc" {
  source = "./../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name
  tenancy  = var.tenancy
  pub1_sub_cidr = var.pub1_sub_cidr
  pub1_sub_name = var.pub1_sub_name
  pub1_sub_az = var.pub1_sub_az
  private1_sub_cidr = var.private1_sub_cidr
  private1_sub_name = var.private1_sub_name
  private1_sub_az = var.private1_sub_az
  private2_sub_cidr = var.private2_sub_cidr
  private2_sub_name = var.private2_sub_name
  private2_sub_az  = var.private2_sub_az
  IGW_name = var.IGW_name
  route_table_public_name = var.route_table_public_name
}

module "security_group" {
  source = "./../../modules/security_group"
  vpc_id = module.vpc.vpc_id
  frontend_sg_name = var.frontend_sg_name
  backend_sg_name = var.backend_sg_name
  rds_sg_name = var.rds_sg_name
  elastiCache_sg_name = var.elastiCache_sg_name
}

module "ec2" {
  source = "./../../modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  pem_key_name = var.pem_key_name
  frontend_instance_name = var.frontend_instance_name
  backend_instance_name = var.backend_instance_name
  public_subnet_id = module.vpc.public_subnet_id
  private1_subnet_id = module.vpc.private1_subnet_id
  frontend_sg = module.security_group.frontend_sg
  backend_sg = module.security_group.backend_sg
  #frontend_eip = module.eip.frontend_eip
  #backend_eip = module.eip.backend_eip
}

module "eip" {
  source = "./../../modules/eip"
  eip_frontend_name =var.eip_frontend_name
  eip_backend_name = var.eip_backend_name
  frontend_instance_id = module.ec2.frontend_instance_id
  backend_instance_id = module.ec2.backend_instance_id
}

module "rds" {
  source = "./../../modules/rds"
  postgres_subnet_name = var.postgres_subnet_name
  rds_allocated_storage = var.rds_allocated_storage
  rds_storage_type = var.rds_storage_type
  rds_name = var.rds_name
  rds_instance_class = var.rds_instance_class
  rds_password = var.rds_password
  rds_multi_az = var.rds_multi_az
  rds_backup_retention_period = var.rds_backup_retention_period
  rds_skip_final_snapshot = var.rds_skip_final_snapshot
  rds_deletion_protection = var.rds_deletion_protection
  rds_tag_name = var.rds_tag_name
  postgres_sg = module.security_group.postgres_sg
  #subnet_ids = [ "module.vpc.private1_subnet_id","module.vpc.private2_subnet_id" ]
  availability_zone = module.vpc.private_availability_zone
  private_availability_zone = module.vpc.private_availability_zone
  kms_key_id = module.kms.kms_key_id
  private1_subnet_id = module.vpc.private1_subnet_id
  private2_subnet_id = module.vpc.private2_subnet_id
}

module "elastiCache" {
  source = "./../../modules/elastiCache"
  elasticache_cluster_id = var.elasticache_cluster_id
  elasticache_node_type = var.elasticache_node_type
  elasticache_snapshot_retention_limit = var.elasticache_snapshot_retention_limit
  elasticache_apply_immediately = var.elasticache_apply_immediately
  #elasticache_subnet_group_name = var.elasticache_subnet_group_name
  elasticache_availability_zone = var.elasticache_availability_zone
  elasticache_az_mode = var.elasticache_az_mode
  elastiCache_sg = module.security_group.elastiCache_sg
  #elastiCache_sg_name = module.security_group.elastiCache_sg_name
  private1_subnet_id = module.vpc.private1_subnet_id
}  

module "kms" {
  source = "./../../modules/kms"
  kms_deletion_window_in_days = var.kms_deletion_window_in_days
  kms_enable_key_rotation = var.kms_enable_key_rotation
  kms_name = var.kms_name
  kms_tag_name = var.kms_tag_name
}

module "s3" {
  source = "./../../modules/s3"
  bucket_name = var.bucket_name
  bucket_acl = var.bucket_acl
  bucket_versioning_enabled = var.bucket_versioning_enabled
  bucket_tag_environment = var.bucket_tag_environment
  bucket_tag_name = var.bucket_tag_name
}  

module "sns" {
  source = "./../../modules/sns"
  sns_topic_name = var.sns_topic_name
}
