#mandatory variable , module has to initialize the below variable
variable "ami_id" {
    type = string
}

#optional , module can override the variable
variable "instance_type" {
    type = string
    default = "t3.micro"
    validation {
        condition = contains(["t3.micro","t3.medium","t2.micro"], var.instance_type)
        error_message = "instance_type can only be t3,micro,t3.medium,t2.micro"
    }
} 