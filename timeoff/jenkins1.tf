# Server definition
# docs from:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "jenkins1" {
  ami           = "ami-033b95fb8079dc481"
  instance_type = "t2.micro"
  associate_public_ip_address = true

  key_name = aws_key_pair.server_key_timeoff.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  subnet_id              = aws_subnet.sn1.id

  tags = {
    Terraform   = "true"
  }
}
