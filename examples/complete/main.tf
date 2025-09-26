terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

import {
  to = module.ec2_instance.aws_instance.this[0]
  id = "i-0a663dac78c9b0349"
}

# import {
#   to = module.ec2_instance.aws_ebs_volume.this["/dev/xvda"]
#   id = "vol-031d556e8d785a584"
# }

module "ec2_instance" {
  source  = "git::https://github.com/Rntinc-z/terraform-aws-ec2-instance.git?ref=1.0.0"

  name = var.instance_name
  create_security_group  = false

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  private_ip             = var.private_ip

  ebs_optimized = var.ebs_optimized
  monitoring    = var.monitoring

  cpu_options = {
    core_count       = var.cpu_core_count
    threads_per_core = var.cpu_threads_per_core
  }

  metadata_options = {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_hop_limit
    instance_metadata_tags      = var.metadata_instance_tags
  }

  root_block_device = {
      volume_type           = var.root_volume_type
      volume_size           = var.root_volume_size
      iops                  = var.root_volume_iops
      throughput            = var.root_volume_throughput
      encrypted             = var.root_volume_encrypted
      delete_on_termination = var.root_delete_on_termination
    }

  tags = var.tags
}