# Creates EC2 Instance 
resource "aws_instance" "app" {
  ami                        = data.aws_ami.my_ami.image_id
  instance_type              = "t2.micro"
  vpc_security_group_ids     = [var.sg]

   tags = {
    Name = "tf-app"
  }

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.private_ip
  }

}

variable "sg" {}

output "public_ip" {
    value = aws_instance.app.public_ip
}