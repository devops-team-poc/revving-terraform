output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.main-public-1.id
}

output "private1_subnet_id" {
  value = aws_subnet.main-private-1.id
}

output "private2_subnet_id" {
  value = aws_subnet.main-private-2.id
}

output "private_availability_zone" {
  value = aws_subnet.main-private-1.availability_zone
}


