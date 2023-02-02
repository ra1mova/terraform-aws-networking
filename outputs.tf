output "subnet_id" {
    value = aws_subnet.public_subnets[*].id
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "private_subnet_id" {
  value = aws_subnet.private_subnets[*].id
}