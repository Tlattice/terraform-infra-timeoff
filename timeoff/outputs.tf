output "jenkins1_public_ip" {
  value = aws_instance.jenkins1.public_ip
}
output "jenkins1_private_ip" {
  value = aws_instance.jenkins1.private_ip
}
