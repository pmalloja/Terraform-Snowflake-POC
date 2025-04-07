variable "SNOWFLAKE_ACCOUNT" {
  type        = string
  description = "Snowflake account identifier"
  sensitive   = true
}

variable "SNOWFLAKE_USER" {
  type        = string
  description = "Snowflake username"
}

variable "SNOWFLAKE_ROLE" {
  type        = string
  description = "Snowflake role"
}

variable "SNOWFLAKE_REGION" {
  type        = string
  description = "Snowflake region"
}

variable "SNOWFLAKE_PRIVATE_KEY" {
  type        = string
  description = "Private key for Snowflake authentication"
  sensitive   = true
}