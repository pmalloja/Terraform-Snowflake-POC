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
      name = "TF-Snowflake-Dev1"
    }
  }

}
provider "snowflake" {
}

resource "snowflake_database" "demo_db1" {
  name    = "DEMO_DB1"
  comment = "Database for Snowflake Terraform demo"
}