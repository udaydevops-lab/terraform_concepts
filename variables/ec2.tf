resource "aws_instance" "db" {
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type

    tags = var.tags
}


resource "aws_security_group" "allow_ssh" {
  name   = var.sg_name
  description = "allowing SSH sccess"

ingress {
    from_port        = var.port_number
    to_port          = var.port_number
    protocol         = "tcp"
    cidr_blocks      = var.allowed_cidr
  }

  egress {
      from_port        = 0      # allow all ports  
      to_port          = 0      # allow all ports
      protocol         = "-1"   # allow all protocals
      cidr_blocks      = var.allowed_cidr
    }

}