resource "aws_instance" "expense" {
    for_each = var.instance_names # each.key and each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = aws_security_group.allow_ssh.id # replace with you SG ID
    instance_type = each.value
    tags = merge(
        var.common_tags,
        {
            Name = each.key
            Module = each.key
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