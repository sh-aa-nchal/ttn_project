#database

locals {
  instance_tag = "by-terraform"
}

// Picking exsisting key

data "aws_key_pair" "pro-key" {
  filter {
    name = "tag:purpose"
    values = ["project"]
  }
	
resource "aws_instance" "database-instance" {
  ami           = var.ami-db
  instance_type = var.instance-dbdb
  key_name = data.aws_key_pair.pro-key.key_name
  user_data = filebase64("${path.module}/userdata.sh")
  tags = {
		Name = "database-test"
	}
}
