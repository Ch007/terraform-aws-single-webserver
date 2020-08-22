# Deploy a single ec2 instance
# This template used to create web server on a single EC2 Instance

# Create aws credential profile in your local directory("~/.aws/credentials") provide access key and secret key under the profile .

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile = "demo"
}

# Instance details

resource "aws_instance" "example" {
  # Ubuntu Server SSD Volume Type in us-east-1
  ami = "ami-2d39803a"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World Demo" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF
}

# Create a security group for ec2 instance

resource "aws_security_group" "instance" {
  name = "demo-webserver-security-group-tf"

  # Inbound HTTP from anywhere
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}