output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instance.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = module.ec2_instance.arn
}

output "instance_state" {
  description = "State of the EC2 instance"
  value       = module.ec2_instance.instance_state
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.ec2_instance.private_ip
}

output "private_dns" {
  description = "Private DNS name of the instance"
  value       = module.ec2_instance.private_dns
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = module.ec2_instance.public_ip
}

output "public_dns" {
  description = "Public DNS name of the instance"
  value       = module.ec2_instance.public_dns
}

output "availability_zone" {
  description = "Availability zone of the instance"
  value       = module.ec2_instance.availability_zone
}

output "primary_network_interface_id" {
  description = "ID of the primary network interface"
  value       = module.ec2_instance.primary_network_interface_id
}

output "root_block_device" {
  description = "Root block device information"
  value       = module.ec2_instance.root_block_device
}