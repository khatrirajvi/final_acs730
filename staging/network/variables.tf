# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Group_14"
    "App"   = "Web"
  }
}

# Prefix to identify resources
variable "prefix" {
  type    = string
  default = "Group14"
}

# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.250.0.0/16"
  type        = string
  description = "Staging VPC "
}

# Provision public subnets in staging VPC
variable "public_cidr_blocks" {
  default     = ["10.250.1.0/24", "10.250.2.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs for Staging"
}


# Provision private subnets in staging VPC
variable "private_cidr_blocks" {
  default     = ["10.250.3.0/24", "10.250.4.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs for Staging"
}

# Variable to signal the current environment 
variable "env" {
  default     = "staging"
  type        = string
  description = "Deployment Environment"
}