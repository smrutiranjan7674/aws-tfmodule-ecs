variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the cluster"
  type        = map(string)
  default     = {}
}