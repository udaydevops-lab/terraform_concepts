# output "db_private_ip" {
#   value = aws_instance.expense[lookup(var.instance_names, "db")].private_ip
# }

# output "backend_private_ip" {
#   value = aws_instance.expense[lookup(var.instance_names, "backend")].private_ip
# }

# output "frontend_public_ip" {
#   value = aws_instance.expense[lookup(var.instance_names, "frontend")].public_ip
# }

output "instance_ips" {
  value = {
    for instance_name, instance in aws_instance.expense :
    instance_name => {
      public_ip  = instance.public_ip
      private_ip = instance.private_ip
    }
  }
}
