# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Group_9"
    "App"   = "Web"
  }
}

# Prefix to identify resources
variable "prefix" {
  type    = string
  default = "Group9"
}

# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.250.0.0/16"
  type        = string
  description = "Prod VPC "
}

# Provision public subnets in prod VPC
variable "public_cidr_blocks" {
  default     = ["10.250.1.0/24", "10.250.2.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs for Prod"
}


# Provision private subnets in prod VPC
variable "private_cidr_blocks" {
  default     = ["10.250.3.0/24", "10.250.4.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs for Prod"
}

# Variable to signal the current environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}