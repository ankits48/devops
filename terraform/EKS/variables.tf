variable "location" {
    default = "us-east-1"
}

variable "os_name" {
    default = "ami-022e1a32d3f742bd8"
}

variable "key" {
    default = "first"
}

variable "instance-type" {
    default = "t3.medium"
}

variable "vpc-cidr" {
    default = "10.10.0.0/16"  
}

variable "subnet1-cidr" {
    default = "10.10.2.0/24"
  
}
variable "subnet2-cidr" {
    default = "10.10.3.0/24"
  
}
variable "subent_az" {
    default =  "us-east-1a"  
}
variable "subent_az-2" {
    default =  "us-east-1b"  
}