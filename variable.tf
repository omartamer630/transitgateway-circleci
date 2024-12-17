variable "AWS_DEFAULT_REGION" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Most Used Variables in All services"
  type        = string
}

variable "cidr" {
  description = "VPCs CIDR blocks"
  type = list(object({
    cidr = string
    name = string
  }))
}

variable "AZs" {
  description = "Subnets AZs"
  type        = list(string)
}
