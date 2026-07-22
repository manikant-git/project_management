module "frontend" {
  source = "./modules/ec2"

  instance_name = "frontend-server"
  ami_id         = var.ami_id
  instance_type  = "t2.micro"
}

module "backend" {
  source = "./modules/ec2"

  instance_name = "backend-server"
  ami_id         = var.ami_id
  instance_type  = "t2.micro"
}
