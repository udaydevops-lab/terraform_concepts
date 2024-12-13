variable "ami_id" {
  default = "ami-0b4f379183e5706b9"
}

variable "instance_names" {
  type = list
  default = ["db","backend","frontend"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "commom_tags" {              
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "yes"
    }
}

variable "zone_id" {
  default = "Z04473913DUPDZLWO0QLR"
}

variable "domain_name" {
  default = "prajai.online"
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