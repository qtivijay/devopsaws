resource "aws_instance" "terraform" {

    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = ["sg-0bc7f605c01cc2ed2"]
    
}