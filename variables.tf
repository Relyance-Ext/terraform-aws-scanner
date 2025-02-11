variable "base_name" {
  description = "base name for all resources"
  type        = string
  default     = "Relyance_Sierra"
}

variable "sierra_account_id" {
  description = "The account ID where the core Sierra environment is deployed."
  type        = string
  default     = null
}

variable "main_role_arn" {
  description = "The main worker role ARN to allow assume access from."
  type        = string
  default     = null

  validation {
    condition     = !(var.sierra_account_id != null && var.main_role_arn != null)
    error_message = "The sierra_account_id and main_role_arn variables are mutually exclusive"
  }

  validation {
    condition     = !(var.sierra_account_id == null && var.main_role_arn == null)
    error_message = "The sierra_account_id or main_role_arn variables are required."
  }
}

variable "kms_key_arns" {
  description = "KMS key ARNs used to encrypt S3 buckets."
  type        = list(string)
}

variable "s3_bucket_arns" {
  description = "S3 bucket ARNs to be scanned. Set to [\"*\"] to allow access to all S3 buckets in the account."
  type        = list(string)
}

variable "scanner_external_id" {
  description = "The external ID associated with the scanner role that will be used to scan the S3 scan bucket."
  type        = string
  default     = "relyance-scanner"
}
