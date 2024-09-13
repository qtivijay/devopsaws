output "public_ip"{
    value = aws_instance.terraform.public_ip
    sensitive = false
    description = "public ip from asw instance"
}