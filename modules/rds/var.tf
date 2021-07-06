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

variable "postgres_sg" {}

#variable "subnet_ids" {}

variable "availability_zone" {}

variable "kms_key_id" {}

variable "private_availability_zone" {}

variable "rds_name" {}

variable "private1_subnet_id" {}

variable "private2_subnet_id" {}
