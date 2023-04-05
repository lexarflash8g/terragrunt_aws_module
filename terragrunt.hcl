terraform {
  source = "./aws_module"
}

locals  {
  subnet_cidr_block = "10.0.20.0/24"
  vpc_cidr_block = "10.0.0.0/16"
}

inputs = {
  vpc_cidr_block = local.vpc_cidr_block
  subnet_cidr_block = local.subnet_cidr_block
}