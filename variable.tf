variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# locals {
#   public_subnet_bits = 24   # Use 24 bits for public subnets
#   private_subnet_bits = 26  # Use 26 bits for private subnets
# }

# variable "public_subnet_bits" {
#   type = number
#   default = 24
# }

# variable "private_subnet_bits" {
#   type = number
#   default = 26
# }
# locals {
#   public_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
#   private_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
# }

# variable "public_cidr_blocks" {
#   default = ["10.0.1.0/24", "10.0.2.0/24"]
# }

# variable "private_cidr_blocks" {
#   default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
# }

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_classiclink" {
  default = "false"
}

variable "enable_classiclink_dns_support" {
  default = "false"
}

variable "preferred_number_of_public_subnets" {
  default = 2
}

variable "preferred_number_of_private_subnets" {
  default     = 4
  description = "number of private subnets"
}

# variable "nat_eip" {
#   type = string
#   default = 1c
# }

variable "name" {
  type    = string
  default = "ak-eip"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

# variable "ami_id" {
#   type        = string
#   description = "AMI ID for the launch template"
#   default     = "${data.aws_ami.latest_ami.id}"
# }

variable "keypair" {
  type        = string
  description = "key pair for the instances"
  default     = "terraform_project_dare.io"
}

variable "account_no" {
  type        = number
  description = "the account number"
  default     = 318867684519
}

variable "master-username" {
  type        = string
  description = "RDS admin username"
  default     = "dbtobi"
}

variable "master-password" {
  type        = string
  description = "RDS master password"
  default     = "administrator"
}

variable "db_name" {
  type        = string
  description = "RDS database name"
  default     = "tobidb"
}