resource "aws_elasticache_subnet_group" "bar" {
  name       = "elastiCache-subnet-group"
  subnet_ids = [ var.private1_subnet_id ]
}

resource "aws_elasticache_cluster" "example" {
  

  cluster_id           = var.elasticache_cluster_id
  engine               = "redis"
  num_cache_nodes      = 1
  node_type             = var.elasticache_node_type

  engine_version           = "3.2.10"
  port                     = 6379
  parameter_group_name     = "default.redis3.2"
  maintenance_window       = "sun:03:00-sun:04:00"    #weekly time range for maintenance on the cache cluster
  snapshot_window          = "04:00-06:00"        #taking a daily snapshot of your cache cluster
  snapshot_retention_limit = var.elasticache_snapshot_retention_limit        #days for which snapshot will be stored

  #automatic_failover_enabled = true

  #at_rest_encryption_enabled = true
  #transit_encryption_enabled = true
  #auth_token                 = "1234567890asdfghjkl"

  apply_immediately = var.elasticache_apply_immediately    #database modifications are applied immediately
  #family            = "redis5.0"   
  #description       = "Test elasticache redis."

 # subnet_group_name  = var.private1_subnet_id
   subnet_group_name  = aws_elasticache_subnet_group.bar.name
  availability_zone  =  var.elasticache_availability_zone
  az_mode            =  var.elasticache_az_mode       #created in a single Availability Zone or multiple Availability Zones 

  security_group_ids = [ var.elastiCache_sg ]
 #security_group_names = module.security_group.elastiCache_sg_name

  tags = {
    Project = "Test-env"
  }
}
