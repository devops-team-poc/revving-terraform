#Attaching Eip to frontend
resource "aws_eip" "frontend" {
  instance = var.frontend_instance_id
  vpc      = true
  tags   =  {
                  name = var.eip_frontend_name
                  
}
}

#Attaching Eip to backend
resource "aws_eip" "backend" {
  instance = var.backend_instance_id
  vpc = true
  tags   =  {
                  name = var.eip_backend_name
                  
}

}


