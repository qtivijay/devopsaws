variable "instance_names" {
  type = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "DEV"
        terraform = "true"
    }
}

variable "zone_id" {
    type = string
    default = "Z07904242N80PGXSVPTJN"
}

variable "domain_name"{
    default = "vijaydevops.store"
}