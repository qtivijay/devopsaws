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

variable "mysql_tags"{
    default = {
        component = "mysql"
    }
    
}

variable "backend_tags"{
    default = {
        component = "backend"
    }
    
}

variable "frontend_tags"{
    default = {
        component = "frontend"
    }
    
}