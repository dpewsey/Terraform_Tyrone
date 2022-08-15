variable "ami" {
  type = string
  default = "ami-0e34bbddc66def5ac"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "subnet_id" {
  type = string
}
variable "security_group_ids" {
  type = list
}
