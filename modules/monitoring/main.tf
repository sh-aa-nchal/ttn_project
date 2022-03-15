
data "aws_key_pair" "pro-key" {
  filter {
    name = "tag:purpose"
    values = ["project"]
  }

resource "aws_instance" "database-instance" {
  ami           = var.ami-mon
  instance_type = var.instance-mon
  key_name = data.aws_key_pair.pro-key.key_name
  user_data = filebase64("${path.module}/userdata.sh")
  tags = {
		Name = "monitoring-test"
	}
}

## infux,elasticsearch,grafan,kibana

