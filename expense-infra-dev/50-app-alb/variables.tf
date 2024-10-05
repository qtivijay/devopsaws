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

variable "app_alb_tags"{
    default = {
        component = "app_alb_tags"
    }
    
}

variable "zone_name" {
    default = "vijaydevops.store"
}