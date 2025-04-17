variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = false
}

variable "enable_encryption" {
  description = "Enable server-side encryption (AES256)"
  type        = bool
  default     = false
}

variable "is_public" {
  description = "Whether the bucket is publicly accessible"
  type        = bool
  default     = false
}


