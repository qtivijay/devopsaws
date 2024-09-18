variable "instance_names" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense"
    Environment = "DEV"
    terraform   = "true"
  }
}

variable "ingress_values" {
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
      description = "openeing 22"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
      description = "openeing 80"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
      description = "openeing 8080"
    }

  ]
}

# variable "zone_id" {
#   type    = string
#   default = "Z07904242N80PGXSVPTJN"
# }

# variable "domain_name" {
#   default = "vijaydevops.store"
# }