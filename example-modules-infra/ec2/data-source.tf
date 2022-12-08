data "aws_ami" "myami" {
  most_recent      = true
  name_regex       = "AMI-Ansible"
  owners           = ["self"]
}