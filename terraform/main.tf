module "web_server" {
  source = "./modules/ec2"

  instance_name = "my-web-server"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
}
