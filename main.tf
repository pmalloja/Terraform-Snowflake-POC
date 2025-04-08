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
      name = "TF-Snowflake-Dev3"
    }
  }

}
provider "snowflake" {
}

resource "snowflake_database" "demo_db2" {
  name    = "DEMO_DB2"
  comment = "Database for Snowflake Terraform demo"
}


module "MARKETING_XSMALL_WH" {
  source         = "./warehouse"
  warehouse_name = "MARKETING_XSMALL_WH"
  warehouse_size = "XSMALL"
}

module "ALL_USERS" {
  source = "./users"
  user_map = {
    TEST_USER1 = { "name" = "TEST_USER1", "first_name" = "test", "last_name" = "user1", "email" = "user@snowflake.example", "default_warehouse" = "COMPUTE_WH", "default_role" = "PUBLIC" }
    TEST_USER2 = { "name" = "TEST_USER2", "first_name" = "test2", "last_name" = "user2", "email" = "user2@snowflake.example", "default_warehouse" = "COMPUTE_WH", "default_role" = "PUBLIC" }
    TEST_USER3 = { "name" = "TEST_USER3", "first_name" = "test3", "last_name" = "user3", "email" = "user3@snowflake.example" }
  }
}
