variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the cluster"
  type        = string
  default     = "1.31"
}

variable "environment" {
  description = "Deployment environment tag"
  type        = string
  default     = "POC"
}

variable "provisioner" {
  description = "Deployment Provisioner tag"
  type        = string
  default     = "Terraform"
}

variable "owner" {
  description = "Deployment owner tag"
  type        = string
  default     = "amityash83@gmail.com"
}

variable "eks_kubecfg_profile_name" {
  description = "Name of the AWS Config Profile from local"
  type        = string
  default     = "default"
}