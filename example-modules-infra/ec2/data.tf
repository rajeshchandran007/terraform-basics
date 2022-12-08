data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "b51-base-with-ansible"
  owners           = ["self"]
}