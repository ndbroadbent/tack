provider "aws" { region = "${ var.aws.region }" }

# variables
variable "aws" {
  default = {
    account-id = ""
    azs = ""
    key-name = ""
    region = ""
  }
}
variable "cidr" {
  default = {
    vpc = "10.0.0.0/16"
    allow-ssh = "0.0.0.0/0"
  }
}
variable "coreos-aws" {
  default = {
    ami = ""
    channel = ""
    type = ""
  }
}
variable "etcd-ips" { default = "10.0.0.10" }
variable "desired-workers" { default = "2" }
variable "instance-type" {
  default = {
    bastion = "t2.nano"
    etcd = "t2.small"
    worker = "c4.large"
  }
}
variable "internal-tld" { default = "k8s" }
variable "k8s" {
  default = {
    hyperkube-image = "gcr.io/google_containers/hyperkube:v1.2.4"
    podmaster-image = "gcr.io/google_containers/podmaster:1.1"
    version = "v1.2.4"
  }
}
variable "name" {}

# outputs
output "azs" { value = "${ var.aws.azs }" }
output "bastion-ip" { value = "${ module.bastion.ip }" }
output "subnet-ids" { value = "${ module.vpc.subnet-ids }" }
output "external-elb" { value = "${ module.etcd.external-elb }" }
