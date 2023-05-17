region = "eu-west-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

# environment = "production"

ami = "data.aws_ssm_parameter.instance_ami.value"

keypair = "terraform_project_dare.io"

# Ensure to change this to your acccount number
account_no = 318867684519

master-username = "dbtobi"

master-password = "administrator"

tags = {
  Owner-Email     = "tobi.salako@cloudboosta.co.uk"
  Managed-By      = "Terraform"
  Billing-Account = 318867684519
}