resource "null_resource" "kubeconfig_update" {
  # Ensure this runs only after the cluster is created
  depends_on = [aws_eks_cluster.eks_cluster]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.aws_region} --name ${aws_eks_cluster.eks_cluster.name} --profile ${var.eks_kubecfg_profile_name}"
  }
  provisioner "local-exec" {
    command = "export AWS_PROFILE=${var.eks_kubecfg_profile_name}"
  }

}

