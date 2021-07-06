#PROVIDER
terraform_region = "us-east-1"
iam_access_key  = "AKIAXVLKSSOFPBQN4Q6E"
iam_secret_key  = "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"

#VPC
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "test-VPC"
tenancy        =  "default"
pub1_sub_cidr = "10.0.1.0/24"
pub1_sub_name = "test-public-subnet"
pub1_sub_az = "us-east-1a"
private1_sub_cidr = "10.0.4.0/24"
private1_sub_name = "test-private1-subnet"
private1_sub_az = "us-east-1a"
private2_sub_cidr = "10.0.5.0/24"
private2_sub_name = "test-private2-subnet"
private2_sub_az = "us-east-1b"
IGW_name = "test-IGW"
route_table_public_name = "test-public-route-table"

#SECURITY_GROUP
frontend_sg_name = "test-frontend-sg"
backend_sg_name = "test-backend-sg"
rds_sg_name     = "test-rds-sg"
elastiCache_sg_name = "test-elastiCache-sg"

#EC2
ami_id          = "ami-0747bdcabd34c712a"
instance_type   = "t2.micro"
pem_key_name    = "beanstalk"
frontend_instance_name = "test-frontend-ec2"
backend_instance_name = "test-backend-ec2"

#EIP
eip_frontend_name  =  "test-eip-frontend"
eip_backend_name   =   "test-eip-backend"

#RDS
postgres_subnet_name   =  "test-postgres-subnet"
rds_allocated_storage  =  "20"
rds_storage_type       =  "gp2"
rds_instance_class     =  "db.t2.micro"
rds_password           =   "redhat1234"
rds_multi_az           =   "false"
rds_backup_retention_period  = "0"
rds_skip_final_snapshot   =  "true"
rds_deletion_protection   = "false"
rds_tag_name              = "test-postgres"
rds_name		  = "testenvpostgres"

#ELASTICACHE
elasticache_cluster_id   = "test-elasticache-cluster"
elasticache_node_type    =  "cache.t2.small"
elasticache_snapshot_retention_limit = "1"
elasticache_apply_immediately = "true"
#elasticache_subnet_group_name = "test-elasticache-subnet"
elasticache_availability_zone = "us-east-1a"
elasticache_az_mode = "single-az"
#elasticache_security_group_ids = 

#KMS
kms_deletion_window_in_days = "7"
kms_enable_key_rotation    = "true"
kms_name                   = "test-kms-name"
kms_tag_name               = "test-kms-key"

#S3
bucket_name            = "test-env-s3bucket"
bucket_acl             = "private" 
bucket_versioning_enabled = "true"
bucket_tag_environment    = "test-env"
bucket_tag_name              = "test-bucket"

#SNS
sns_topic_name     = "test-sns-topic"
