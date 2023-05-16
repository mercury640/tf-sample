variable "bucket_name" {
   description = "bucket for app"
   type        = string
   default     = "arvindemobucket"
} 

variable "bucket_tag" {
  description = "tag for bucket"
  type        = map(string)
  default     = {
    project     = "project-app1",
    environment = "staging"
  }
}

variable "enable_block_public_acls" {
  description = "block_public_acls"
  type        = bool
  default     = true
}

variable "enable_block_public_policy" {
  description = "block_public_acls"
  type        = bool
  default     = true
}

variable "enable_ignore_public_acls" {
  description = "block_public_acls"
  type        = bool
  default     = true
}

variable "enable_restrict_public_buckets" {
  description = "block_public_acls"
  type        = bool
  default     = true
}

variable "principals_type" {
  description = "principles_type"
  type        = string
  default     = "AWS"
}

variable "principles_identifiers" {
  description = "principles_identifiers"
  type        = list(string)
  default     = [ "arn:aws:iam::xxxxxxx:user/awsadmin", ]
}

variable "policy_actions" {
  description = "principles_identifiers"
  type        = list(string)
  default     = [ "s3:GetObject", ]
}