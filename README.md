ECS with ALB Terraform Module

This Terraform module sets up an Amazon ECS (Elastic Container Service) cluster, along with a Task Definition that runs an NGINX container, fronted by an Application Load Balancer (ALB). The module also configures the required IAM roles, security groups, and load balancer listeners.

Features

	•	Creates an ECS cluster with container insights enabled.
	•	Configures IAM roles and policies for task execution.
	•	Deploys a security group for the ALB and ECS tasks.
	•	Sets up an Application Load Balancer with listeners and a target group for ECS.
	•	Configures an ECS task definition and service using the NGINX container.
	•	Exposes the NGINX service through the ALB.

Module Usage

Prerequisites

	•	AWS account and AWS CLI configured.
	•	A VPC and public subnets for deploying the ECS service and ALB.

Usage Example

provider "aws" {
  region = "us-west-2"
}

module "ecs_nginx_service" {
  source = "git::https://github.com/your-organization/ecs-module.git"  # Replace with your module repo

  cluster_name         = "my-ecs-cluster"
  ecs_task_execution_role_name = "ecsTaskExecutionRole"
  public_subnet_ids    = ["subnet-0123456789abcdef0", "subnet-0fedcba9876543210"]
  vpc_id               = "vpc-0abcd1234efgh5678"
  family_name          = "nginx-task"
  cpu                  = 256
  memory               = 512
  container_image      = "nginx:latest"

  tags = {
    Environment = "Production"
    Project     = "ECS Nginx"
  }
}

### **Variables**

| Name                           | Description                                               | Type          | Default           |
| ------------------------------ | --------------------------------------------------------- | ------------- | ----------------- |
| `cluster_name`                 | Name of the ECS Cluster                                   | `string`      | N/A               |
| `ecs_task_execution_role_name` | Name of the ECS Task Execution Role                       | `string`      | N/A               |
| `public_subnet_ids`            | List of public subnet IDs for ALB and ECS tasks           | `list(string)`| N/A               |
| `vpc_id`                       | VPC ID where the ECS cluster and ALB will be deployed     | `string`      | N/A               |
| `family_name`                  | ECS Task Definition family name                           | `string`      | N/A               |
| `cpu`                          | Number of CPU units allocated for the ECS task            | `number`      | 256               |
| `memory`                       | Amount of memory allocated for the ECS task (MiB)         | `number`      | 512               |
| `container_image`              | Docker image to be used for the ECS task (NGINX default)  | `string`      | `nginx:latest`    |
| `tags`                         | Tags to apply to all resources                            | `map(string)` | `{}`              |

### **Outputs**

| Name            | Description                                          |
| --------------- | ---------------------------------------------------- |
| `alb_dns_name`  | DNS name of the Application Load Balancer             |
| `ecs_cluster_id`| ECS Cluster ID                                        |

Deploying the Module

To deploy this module, ensure that you’ve initialized Terraform in your working directory:
terraform init
terraform apply

Terraform will set up an ECS cluster, create a task definition for NGINX, and deploy the service behind an Application Load Balancer. Once deployed, the NGINX service can be accessed via the ALB DNS name, which is output at the end of the Terraform run.

Testing the Deployment

After deployment, you can test the ECS service by navigating to the DNS name of the ALB in your browser:
http://<alb-dns-name>

You should see the default NGINX welcome page, indicating that the service is up and running.

Monitoring

	•	Monitor the ECS service, tasks, and load balancer health checks in the AWS Console.
	•	You can view ECS task logs in Amazon CloudWatch for any troubleshooting purposes.

Contributing

Feel free to open an issue or submit a pull request if you find a bug or would like to add a feature. Contributions are welcome!

Blogs:
A detailed explanation of this module is provided in https://smrutiranjan7674.hashnode.dev/automating-aws-ecs-deployment-with-terraform-modules-and-nginx