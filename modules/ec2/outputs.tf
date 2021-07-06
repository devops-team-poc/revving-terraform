output  "frontend_security_group_id" {
value = aws_instance.frontend.vpc_security_group_ids
}

output  "backend_security_group_id" {
value = aws_instance.backend.vpc_security_group_ids
}

output  "frontend_instance_id" {
value = aws_instance.frontend.id
}

output  "backend_instance_id" {
value = aws_instance.backend.id
}

output  "ec2_key_name" {
value = aws_instance.backend.key_name
}


