
# AWS EKS Cluster and Selenium Hub Setup with Terraform

## Purpose

This project provides a streamlined approach to setting up an AWS EKS (Elastic Kubernetes Service) cluster and deploying a Selenium Hub using Terraform and kubectl. The goal is to automate the infrastructure setup and application deployment process, ensuring consistency and reducing manual configuration errors.

## Architecture Overview

The architecture consists of an AWS EKS cluster that hosts the Selenium Hub. The Terraform scripts automate the creation of the EKS cluster, while kubectl is used to manage the deployment of the Selenium Hub within the cluster.

## Prerequisites

- **AWS Account**: You’ll need an AWS account to set up and access the AWS EKS and other services.
- **AWS CLI**: Installed and configured with your AWS credentials. [Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **Terraform**: Installed to set up the EKS and Selenium Hub cluster. [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- **Kubectl**: Used to manage your EKS cluster from your machine. [Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Configuration

Configure the Terraform variables as needed. Ensure that your AWS credentials are correctly set up in the AWS CLI configuration.

## Setup AWS EKS Cluster & Selenium Hub

1. **Navigate to the Terraform folder**:
   ```bash
   cd terraform
   ```

2. **Initialize, plan, and apply the Terraform configuration**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. **Retrieve Selenium Hub LoadBalancer details**:
   ```bash
   kubectl get svc
   ```

4. **Access Selenium Hub Dashboard**:
   Use the Load Balancer details to access the Selenium Hub Dashboard on port '4444'.

## Troubleshooting

- **Terraform Errors**: Check the Terraform logs for detailed error messages.
- **Kubectl Issues**: Ensure that your kubectl context is correctly set to the EKS cluster.

## Cleanup

To avoid unnecessary costs, tear down the infrastructure using the following command:
```bash
terraform destroy
```

## Contributing

Feel free to contribute to this project by submitting pull requests or opening issues.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Reference Links
**EKS With Terraform:**
* https://dev.to/mariehposa/managing-aws-eks-with-terraform-4ma8

**Selenium:** 
* https://github.com/kubernetes/examples/tree/master/staging/selenium
* https://medium.com/divedeepai/integration-of-selenium-grid-and-kubernetes-for-running-selenium-scripts-and-video-recording-of-f80772b34ab6
