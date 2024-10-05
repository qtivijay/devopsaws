variable "project_name"{
    default = "expense"
}

variable "environment"{
    default = "dev"
}

variable "common_tags"{
    default = {
        project_name = "expense"
        environment = "dev"
        Terraform = "true"
    }
}

variable "rds_tags"{
    default = {
        component = "mysql"
    }
    
}

variable "zone_name" {
    default = "vijaydevops.store"
}