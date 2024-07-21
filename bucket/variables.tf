variable "bucket_name" {
  description = "The name of the bucket to create"
  type        = string
}

variable "tags" {
  description = "Tags used for all resources"
  type        = map(string)
  default     = {}
}