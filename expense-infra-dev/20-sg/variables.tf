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

variable "sg_tags" {
    default = {}
}

variable "mysql_sg_tags" {
    default = {
        Component = "mysql"
    }
}
