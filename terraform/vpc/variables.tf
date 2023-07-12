variable "location" {
    default = "us-east-1"
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
variable "subnet1-cidr-1" {
    default = "10.10.4.0/24"
  
}
variable "subnet2-cidr-2" {
    default = "10.10.5.0/24"
  
}
variable "subnet_az" {
    default =  "us-east-1a"  
}
variable "subnet_az-2" {
    default =  "us-east-1b"  
}