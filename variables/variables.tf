###variable preferences###
#1. command line
#2. tfvars
#3. ENV variable
#4. variable default value

variable "ami_id" {
  default = "ami-0b4f379183e5706b9"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tags" {               # Map
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    }
}

variable "sg_name" {
  type = string
  default = "allow_ssh"
}

variable "port_number" {
  type = number
  default = 22
}

variable "allowed_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}