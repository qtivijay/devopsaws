variable "ami" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "Imageid of RHEL-9-devops-practice"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "image details"
}

variable "tags" {
    type = map
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        terraform = "true"
    }
}

variable "sg_name" {
    type = string
    default = "allow_sshh"
}

variable "sg_description" {
    type = string
    default = "Allow port number 22 for SSH access"
}

variable "from_port"{
    type = number
    default = 22
}
variable "to_port"{
    type = number
    default = 22
}
variable "protocol"{
    type = string
    default = "tcp"
}

variable "ingress_cidr"{
    type = list(string)
    default = ["0.0.0.0/0"]
}