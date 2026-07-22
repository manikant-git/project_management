output "instance_id" {
  value = module.web_server.instance_id
}

output "public_ip" {
  value = module.web_server.public_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}
