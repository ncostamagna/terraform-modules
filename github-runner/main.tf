resource "aws_instance" "ec2_runner" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.route_allow_http_ssh.id}"]
  subnet_id                   = var.subnet_id
  key_name                    = var.ec2_key_id

  root_block_device {
    volume_size = 30
  }

  user_data = templatefile("${path.module}/user_data.tftpl", { github_token = var.github_token,
    github_url    = var.github_url,
    github_name   = var.github_name,
    github_labels = var.github_labels,
    github_file   = var.github_file,
    github_code   = var.github_code
    github_version = var.github_version
  })

  tags = var.tags
}

resource "aws_security_group" "route_allow_http_ssh" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}