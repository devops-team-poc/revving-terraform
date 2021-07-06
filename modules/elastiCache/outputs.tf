output  "elasticache_cluster_id" {
value = aws_elasticache_cluster.example.cluster_id
}

output  "elasticache_security_group_ids" {
value = aws_elasticache_cluster.example.security_group_ids
}

output  "elasticache_subnet_group_name" {
value = aws_elasticache_cluster.example.subnet_group_name
}


