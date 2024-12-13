output "ami_id" {
  value = data.aws_ami.expense.id
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}