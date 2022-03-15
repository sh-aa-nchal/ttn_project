<<<<<<< HEAD
#monitoring

provider "aws" {
  region  = "us-east-1"
  profile = "ttnproject"
}

locals {
  instance_tag = "by-terraform"
}

// Creating Key
resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
}

// Generating Key-Value Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.tls_key.public_key_openssh

  tags = {
    Environment = "${local.instance_tag}-test"
  }

  depends_on = [
    tls_private_key.tls_key
  ]
}

### Private Key PEM File ###
resource "local_file" "key_file" {
  content  = tls_private_key.tls_key.private_key_pem
  filename = "terraform-key.pem"

  depends_on = [
    tls_private_key.tls_key
  ]
}

resource "aws_instance" "database-instance" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  user_data = filebase64("${path.module}/userdata.sh")
  tags = {
		Name = "monitoring-test"
	}
}
=======
## infux,elasticsearch,grafan,kibana
>>>>>>> bc90d336ff3c689d0e522ff96667e98ed63233aa
