output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_runner.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_runner.public_ip
}

output "public_dns" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_runner.public_dns
}