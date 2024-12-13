output "db_private_ip" {
  value = aws_instance.expense[index(var.instance_names, "db")].private_ip
}

output "backend_private_ip" {
  value = aws_instance.expense[index(var.instance_names, "backend")].private_ip
}

output "frontend_public_ip" {
  value = aws_instance.expense[index(var.instance_names, "frontend")].public_ip
}