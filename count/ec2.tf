resource "aws_instance" "expense_instance" {
    #count = 3         ## it will create 3 instances with the same name
    count = length(var.instance_names)  # Dynamically creates instances based on the number of names
    ami = "ami-0b4f379183e5706b9"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t2.micro"

    tags = {
      Name = var.instance_names[count.index]
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