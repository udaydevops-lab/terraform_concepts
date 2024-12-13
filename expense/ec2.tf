resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_names[count.index] == "db" ? "t2.mediam" : "t2.micro"

    tags = merge(
      var.commom_tags,
      {
        Name = var.instance_names[count.index]
      }
    )
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