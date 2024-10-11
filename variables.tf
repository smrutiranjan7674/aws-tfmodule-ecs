variable "cluster_name" {
  description = "Name of the ECS Cluster"
  type        = string
}

variable "ecs_task_execution_role_name" {
  description = "Name of the ECS Task Execution Role"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC in which to launch the ECS cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ECS service networking"
  type        = list(string)
}

variable "family_name" {
  description = "Family name of the ECS Task Definition"
  type        = string
}

variable "cpu" {
  description = "Number of CPU units used by the ECS task"
  type        = number
}

variable "memory" {
  description = "Amount of memory (in MiB) used by the ECS task"
  type        = number
}

variable "container_image" {
  description = "Docker image to be used for the container"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}