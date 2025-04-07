terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.67.0"
    }
  }


  backend "remote" {
    organization = "Snowflake-Terraform2025"

    workspaces {
      name = "TF-Snowflake-Dev"
    }
  }
}

provider "snowflake" {
  account     = var.SNOWFLAKE_ACCOUNT
  username    = var.SNOWFLAKE_USER
  role        = var.SNOWFLAKE_ROLE
  private_key = var.SNOWFLAKE_PRIVATE_KEY
  region      = var.SNOWFLAKE_REGION
}

variable "SNOWFLAKE_ACCOUNT" {
  type        = string
  description = "The Snowflake account identifier."
}

variable "SNOWFLAKE_USER" {
  type        = string
  description = "The Snowflake username."
}

variable "SNOWFLAKE_ROLE" {
  type        = string
  description = "The default Snowflake role."
}

variable "SNOWFLAKE_PRIVATE_KEY" {
  type        = string
  sensitive   = true
  description = "The private key for Snowflake authentication."
}

variable "SNOWFLAKE_REGION" {
  type        = string
  description = "The Snowflake region (e.g., AWS_US_EAST_2)."
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}