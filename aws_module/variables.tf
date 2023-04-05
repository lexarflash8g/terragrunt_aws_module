variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
}

variable "subnet_cidr_block" {
    description = "subnet cidr block"
    type = string
}

variable "vpc_cidr_block" {
    description = "vpc cidr block"
    type = string
}