# Instance creation
# using this for referenece: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "project" {
  ami           = var.ami_id # us-west-2
  instance_type = var.instance_type

  tags = {
    Name = "terraform-ec2"
  }
  }