#requirements
#################################################################
#1. create 3 aws servers - ['mysql','backend','frontend']
#------------------------------------------------------------------
#2. create 3 aws records -
# mysql - mysql.vijaydevops.store
# backend - mysql.vijaydevops.store
# frontend - vijaydevops.store
#--------------------------------------------------------------------
#3. 3 aws instances types
#   mysql instance - t2.small
#   backend instance, front instance - t3.micro  
#--------------------------------------------------------------------

resource "aws_instance" "expense" {
  for_each = var.instance_names
  #count                  = length(var.instance_names)
  ami                    = data.aws_ami.vijaydevops.id
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = merge(
    var.common_tags,
    var.tags,
    {
      Name = each.key
    }
  )

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }

}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh_${var.tags.Environment}" #allow_ssh is already there in my account
  description = "Allow port number 22 for SSH access"

  # usually we allow everything in egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  #terraform will give us variable with block name
  dynamic "ingress" {
    for_each = var.ingress_values
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  tags = merge(
    var.common_tags,
    var.tags,
    {
      Name = "allow_sshh_${var.tags.Environment}"
    }
  )
}