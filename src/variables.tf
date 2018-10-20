#
# Provider variables
#
variable "aws_access_key" {
  type = "string"
}
variable "aws_secret_key" {
  type = "string"
}
variable "aws_region" {
  type = "string"
}

#
# Variables
#
variable "vpc_network_name" {
  description = "VPC resources name"
}
variable "eks_cluster_name" {
  description = "EKS Cluster name"
}
variable "vpc_cidr_block" {}
variable "vpc_subnet_cidr_block" {}
variable "pritunl_server_aws_key_pair_name" {}
variable "pritunl_server_aws_key_pair_local" {}
