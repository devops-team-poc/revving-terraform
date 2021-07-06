resource "aws_instance" "frontend" {
#  ami           = data.aws_ami.ec2.id
   ami              = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [ var.frontend_sg ]
  key_name = var.pem_key_name
  #key_name =  aws_key_pair.new_keypair.id

  tags = {
    Name = var.frontend_instance_name
  }
}


resource "aws_instance" "backend" {
#  ami           = data.aws_ami.ec2.id
  ami              = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.private1_subnet_id
  vpc_security_group_ids = [ var.backend_sg ]
  key_name = var.pem_key_name
  #key_name =  aws_key_pair.new_keypair.id

  tags = {
    Name = var.backend_instance_name
  }
}


