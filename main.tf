terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
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
  account    = var.SNOWFLAKE_ACCOUNT
  username   = var.SNOWFLAKE_USER
  role       = var.SNOWFLAKE_ROLE
  region     = var.SNOWFLAKE_REGION
  private_key = var.SNOWFLAKE_PRIVATE_KEY
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}