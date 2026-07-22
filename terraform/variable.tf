variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
  default     = "ami-0aba19e56f3eaec05"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
