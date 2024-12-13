# variable "instance_names" {
#   default = {
#   db = "t2.medium"
#   backend = "t2.micro"
#   frontend = "t2.micro"
#   }
# }

# variable "commom_tags" {
  
#   default = {
#     Project = "Expense"
#     Terraform = "true"
#   }
# }

# variable "domain_name" {
#     default = "prajai.online"
# }

# variable "zone_id" {
#   default = "Z04473913DUPDZLWO0QLR"
# }



variable "instance_names" {
  type        = map
  default     = {
    db = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "true"
    }
}

variable "domain_name" {
    default = "prajai.online"
}

variable "zone_id" {
    default = "Z04473913DUPDZLWO0QLR"
}
