output  "frontend_sg" {
value = aws_security_group.frontend.id
}

output  "backend_sg" {
value = aws_security_group.backend.id
}

output  "postgres_sg" {
value = aws_security_group.postgres.id
}

output  "elastiCache_sg" {
value = aws_security_group.elastiCache.id
}

#output  "elastiCache_sg_name" {
#value = aws_security_group.elastiCache.id
#}


