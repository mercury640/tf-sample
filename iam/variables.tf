variable "user_names" {
  description = "IAM Users"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}