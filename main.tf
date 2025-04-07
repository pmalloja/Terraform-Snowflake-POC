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
  user        = var.SNOWFLAKE_USER
  role        = var.SNOWFLAKE_ROLE
  private_key = var.SNOWFLAKE_PRIVATE_KEY
  region      = var.SNOWFLAKE_REGION
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}