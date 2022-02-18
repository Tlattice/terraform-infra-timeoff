resource "aws_key_pair" "server_key_timeoff" {
  key_name   = "server-key-timeoff"
  public_key = "~/.ssh/server_timeoff.pub"
}
