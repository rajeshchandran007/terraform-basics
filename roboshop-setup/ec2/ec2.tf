# Request a spot instance at $0.03
# resource "aws_spot_instance_request" "spot" {
#   ami                          = data.aws_ami.myami.image_id
#   instance_type                = "t3.micro"
#   wait_for_fulfillment         = true
#   vpc_security_group_ids       = [aws_security_group.allows_ssh.id]

#   tags = {
#     Name = var.COMPONENT
#   }

#   connection {
#     type     = "ssh"
#     user     = "centos"
#     password = "DevOps321"
#     host     = self.private_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "ansible-pull -U https://github.com/b51-clouddevops/ansible.git -e ansible_user=centos -e ansible_password=DevOps321 -e COMPONENT=${var.COMPONENT} -e APP_VERSION=${var.APP_VERSION} -e ENV=dev roboshop-pull.yml"
#     ]
#   }

# }


# Creates EC2 Instance 
resource "aws_instance" "app" {
  ami                        = data.aws_ami.myami.image_id
  instance_type              = "t2.micro"
  vpc_security_group_ids     = [aws_security_group.allows_ssh.id]

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.private_ip
  }

  provisioner "remote-exec" {
    inline = [
      "ansible-pull -U https://github.com/rajeshchandran007/ansible.git -e ansible_user=centos -e ansible_password=DevOps321 -e DB_PASSWORD=RoboShop@1 -e COMPONENT=${var.COMPONENT} -e APP_VERSION=${var.APP_VERSION} -e ENV=dev roboshop-pull.yml"
    ]
  }

  tags = {
    Name = "${var.COMPONENT}-robot"
  }
}

