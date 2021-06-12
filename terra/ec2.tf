resource "aws_instance" "ansible-terminal" {
  ami                    = data.aws_ami.base_image.id
  instance_type          = "t2.micro"
  key_name               = "terraformec2"
  vpc_security_group_ids = [aws_security_group.sec_group_block.id]
  tags = {
    Name = "ansible-terminal"
  }
}
resource "aws_instance" "ansible-target1" {
  ami                    = data.aws_ami.base_image.id
  instance_type          = "t2.micro"
  key_name               = "terraformec2"
  vpc_security_group_ids = [aws_security_group.sec_group_block.id]
  tags = {
    Name = "ansible-target1"
  }
}
resource "aws_instance" "ansible-target2" {
  ami                    = data.aws_ami.base_image.id
  instance_type          = "t2.micro"
  key_name               = "terraformec2"
  vpc_security_group_ids = [aws_security_group.sec_group_block.id]
  tags = {
    Name = "ansible-target2"
  }
}

##eip
resource "aws_eip" "eip_aterm" {
  vpc = true
}
resource "aws_eip" "eip_atarg1" {
  vpc = true
}
resource "aws_eip" "eip_atarg2" {
  vpc = true
}

resource "aws_eip_association" "eip_aterm" {
  instance_id   = aws_instance.test_cluster_m1.id
  allocation_id = aws_eip.eip_aterm.id
}
resource "aws_eip_association" "eip_atarg1" {
  instance_id   = aws_instance.target1.id
  allocation_id = aws_eip.eip_atarg1.id
}
resource "aws_eip_association" "eip_atarg2" {
  instance_id   = aws_instance.target2.id
  allocation_id = aws_eip.eip_atarg2.id
}
###########

output "instance_test_cluster_w1_ip" {
  value = aws_instance.ansible-terminal.public_ip
}
output "instance_test_cluster_w2_ip" {
  value = aws_instance.test_cluster_w2.public_ip
}
output "instance_test_cluster_m1_ip" {
  value = aws_instance.test_cluster_m1.public_ip
}
