resource "aws_instance" "db" {
    ami = data.aws_ami.expense.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type

    tags = {
      Name = "db"
    }
}


resource "aws_security_group" "allow_ssh" {
  name   = "allow_ssh"
  description = "allowing SSH sccess"

ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
      from_port        = 0  # allow all ports  
      to_port          = 0  # allow all ports
      protocol         = "-1"    # allow all protocals
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }


}